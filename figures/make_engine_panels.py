"""Render page 1 of the Pandoc and Tylax conversions for the README comparison.

Engine .typ outputs come from the Lathe submodule; needs `typst` on PATH.
Run: python figures/make_engine_panels.py
"""
import subprocess
import tempfile
from pathlib import Path

import fitz

ROOT = Path(__file__).resolve().parent.parent
SAMPLE = "05_tables_simple_005"
SRC = ROOT / "third_party/lathe/results/latex_benchmark_v0" / SAMPLE.rsplit("_", 1)[0] / SAMPLE
OUT = ROOT / "figures"

for engine in ("pandoc", "tylax"):
    with tempfile.TemporaryDirectory() as tmp:
        pdf = Path(tmp) / f"{engine}.pdf"
        subprocess.run(["typst", "compile", "--root", str(SRC), str(SRC / f"{engine}.typ"), str(pdf)],
                       check=True)
        fitz.open(pdf)[0].get_pixmap(dpi=110).save(OUT / f"engine_{engine}_{SAMPLE}.png")
