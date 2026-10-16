#!/usr/bin/env python3
"""Score the deterministic engines on the hard sample set.

The methods x metrics tables in RESULTS.md only cover LLM methods; the
engine baselines (Pandoc, Tylax, TypeTeX) were charted on the full 127-sample
benchmark but never on these 8. This grades their already-stored .typ outputs
with the same pipeline run_task.py uses for a final candidate: typst compile,
compare_pdfs.py against the pdfLaTeX reference, then raster_v0.2 recombination.

No pandoc/pdflatex needed -- the .typ outputs and reference PDFs are on disk.
Run with the lathe env python: python score_engines.py
"""

from __future__ import annotations

import csv
import json
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
LATHE = ROOT / "third_party" / "lathe"
LATHE_PY = Path(sys.executable)
COMPARE = LATHE / "scripts/evaluation/compare_pdfs.py"
ENGINE_ROOT = LATHE / "results/latex_benchmark_v0"

CORE = [
    "06_tables_moderate_010", "05_tables_simple_023", "05_tables_simple_005",
    "09_algorithms_003", "05_tables_simple_021", "07_figures_captions_007",
]
EXTENDED = ["04_math_aligned_014", "03_math_inline_display_004"]
ENGINES = ["pandoc", "tylax", "typetex"]
METRICS = ["overall", "content", "layout", "typography", "raster", "pagination"]

sys.path.insert(0, str(HERE))
from raster_v2 import raster_v2, recombine  # noqa: E402


def reference_pdf(sample_id: str) -> Path:
    """Reference render path, from the benchmark split manifest."""
    with (LATHE / "data/latex_benchmark_v0/splits/prompt_dev_33.csv").open() as fh:
        for row in csv.DictReader(fh):
            if row["sample_id"] == sample_id:
                return LATHE / row["reference_pdf"]
    raise FileNotFoundError(f"no reference for {sample_id}")


def engine_source(sample_id: str, engine: str) -> Path:
    category = sample_id.rsplit("_", 1)[0]
    return ENGINE_ROOT / category / sample_id / f"{engine}.typ"


def score_one(sample_id: str, engine: str, workdir: Path) -> dict:
    src = engine_source(sample_id, engine)
    if not src.exists():
        return {"status": "missing"}

    ref = reference_pdf(sample_id)
    pdf = workdir / "candidate.pdf"
    # Compile from the engine output's own directory so relative asset paths resolve.
    compiled = subprocess.run(
        ["typst", "compile", "--root", str(src.parent), str(src), str(pdf)],
        capture_output=True, text=True,
    )
    if compiled.returncode != 0:
        return {"status": "failed_compile", "log": compiled.stderr[-2000:]}

    diag = workdir / "diagnostics"
    graded = subprocess.run(
        [str(LATHE_PY), str(COMPARE), str(ref), str(pdf), "--out-dir", str(diag)],
        capture_output=True, text=True,
    )
    if graded.returncode != 0:
        return {"status": "failed_score", "log": graded.stderr[-2000:]}

    metrics = json.loads((diag / "metrics.json").read_text())
    scores = metrics["scores"]
    rescored = recombine(scores, raster_v2(ref, pdf)["raster"])

    entry = {k: scores[k] for k in METRICS}
    entry.update(status="ok", raster=rescored["raster"], overall=rescored["overall"])
    entry["pages"] = f"{metrics['reference_pages']}/{metrics['candidate_pages']}"
    details = metrics["content_details"]
    entry["token_precision"] = details["token_precision"]
    entry["token_recall"] = details["token_recall"]
    return entry


def main() -> None:
    results: dict[str, dict[str, dict]] = {}
    for sample_id in CORE + EXTENDED:
        for engine in ENGINES:
            with tempfile.TemporaryDirectory() as tmp:
                entry = score_one(sample_id, engine, Path(tmp))
            results.setdefault(engine, {})[sample_id] = entry
            overall = entry.get("overall")
            shown = f"{overall * 100:5.1f}" if overall is not None else entry["status"]
            print(f"{sample_id:30s} {engine:9s} {shown}", flush=True)

    out = HERE / "engine_baseline_hard_set.json"
    out.write_text(json.dumps(results, indent=1) + "\n")
    print(f"\nwrote {out.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
