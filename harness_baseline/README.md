# Harness baseline — iterative LaTeX→Typst beyond one-shot

Scratch experiment (outside the `lathe/` repo). Results table lives in
`RESULTS.md` (regenerate with `python3 make_results.py` after each run). Goal: establish how much an
*agentic* loop (edit → compile → score → edit) improves on the one-shot LLM
baseline, on the hardest samples and hardest metric axes, with and without
visual feedback.

## Baseline (reproduced locally, 2026-07-14)

`baseline_oneshot_gemini_flashlite.csv` = pdf_fidelity_v0.1 scores of the
one-shot gemini-3.1-flash-lite cascade on 27/30 prompt-dev samples
(3 excluded: their committed `output.typ` no longer compiles under local
typst 0.15 — `03_math_inline_display_011`, `03_math_inline_display_014`,
`04_math_aligned_012`).

Component means (out of 100): content 89.6, typography 83.9, pagination 87.9,
**layout 53.0**, **raster 9.2** (v0.1; see metric revision below), overall 48.1.

## Metric revision: raster_v0.2 (2026-07-14)

The v0.1 raster ceiling (~25–30 even for visually faithful conversions) was
diagnosed as **metric harshness, not font mismatch**: candidates already embed
New Computer Modern (per-word registered ink F1 ≈ 0.84 vs the pdfLaTeX
reference), while v0.1's foreground SSIM sat at ≈ 0.03 for every real pair
(25% of the weight, dead) and its ±2 px ink tolerance was below unavoidable
cross-engine drift (a uniform 8 px shift of an *identical* page scored 82).

`raster_v2.py` defines **raster_v0.2** = 0.70·ink F1 (±4 px tolerance) +
0.30·exp(−edge_dist/10), SSIM dropped; same 144 DPI renders and ink threshold.
Calibration: identity = 100, uniform 8 px shift ≈ 96, blank page = 0. It
rescored all stored reference/candidate PDF pairs (runs + gemini baseline) —
no reruns — writing `runs/<run>/raster_v2.json` and `baseline_raster_v2.json`;
`make_results.py` prefers these, recombining overall/visual with unchanged
v0.1 weights. Rank order vs v0.1 is preserved; gates don't use raster, so all
PASS/FAIL verdicts are unchanged. Best observed raster_v0.2: 78.9.

**Not yet wired into the harness loop**: `score.sh` / `feedback_v2.py` still
show v0.1 raster to the agent mid-run; future runs should feed raster_v0.2 to
intermediate feedback (final tables already use it via `make_results.py`).

## Hardest metrics (in order)

1. **Raster** (baseline mean 9.2 under v0.1, 8.2 rescored under v0.2) —
   unregistered pixel comparison; punishes paper size / margin / leading
   mismatch. v0.2 removes most of the false harshness; humans *do* object to
   a page that visibly doesn't look like the original, so we track it, gate
   on **relative** improvement only.
2. **Layout** (mean 53.0) — matched-word geometry + reading flow. Humans
   directly object to displaced content; this is the primary hard target.
3. **Pagination on tables/algorithms** — page-count mismatches (2/3, 3/2,
   2/1) are the single most human-objectionable failure; must be perfect.

## Hardest samples (task set, worst-first by baseline overall)

(Numbers below are the original v0.1 scores used to select the task set;
RESULTS.md shows the rescored values.)

| sample | baseline overall | failure mode |
|---|---:|---|
| `06_tables_moderate_010` | 30.9 | table reflow, 2→3 pages |
| `05_tables_simple_023`   | 31.6 | table reflow, 3→2 pages |
| `05_tables_simple_005`   | 33.5 | table reflow, 2→3 pages |
| `09_algorithms_003`      | 34.4 | algorithm block, 2→1 pages |
| `05_tables_simple_021`   | 36.1 | table reflow, 3→2 pages |
| `07_figures_captions_007`| 38.4 | figure/caption raster collapse (2.6) |
| `04_math_aligned_014`    | 41.9 | aligned math, 2→1 pages |
| `03_math_inline_display_004` | 45.0 | math content recall 74.7 |

Suggested core set: the top 6 (tables ×4, algorithms ×1, figures ×1); add the
two math samples if budget allows.

## Pass/fail criteria (frozen before running)

Gates chosen so a "pass" is defensible to a human reviewer; absolute where
humans would object, relative where the metric is known-harsh.

Hard gates (all required to PASS a sample):

- **G1 compile:** `output.typ` compiles with typst 0.15.
- **G2 pagination:** page count matches reference AND pagination score = 100
  (every matched word on its original page).
- **G3 content:** token precision AND recall ≥ 0.95 (humans object most to
  missing/invented text).
- **G4 layout:** layout ≥ 75 (baseline mean 53; best baseline sample 72).

Soft targets (report, don't gate):

- **raster ≥ 3× the sample's baseline raster** (relative — the unregistered
  metric penalizes benign margin choices humans wouldn't object to). Compare
  like-for-like: v0.2 run scores against the v0.2-rescored baseline.
- **overall ≥ 70**, or ≥ +20 points over the sample baseline.

Run-level success criterion for the experiment itself: the iterative harness
passes G1–G4 on ≥ 4/6 core samples in at least one condition, and the
visual condition beats no-visual on mean overall by a margin > run-to-run
noise (do 2 seeds/repeats on 1–2 samples to estimate noise).

## Harness

`run_task.py` wraps the `claude` CLI (installed, v2.1.114) in print mode with
budget cap. Per sample it creates `runs/<sample>__<mode>__<model>__<label>/work/`
containing `main.tex`, `reference.pdf`, `output.typ` (agent's deliverable),
and `./score.sh` (typst compile + `lathe/scripts/evaluation/compare_pdfs.py`
→ prints overall/component scores, writes `feedback/metrics.json`).

Two conditions:

- `--visual`: reference page PNGs provided; diff/box diagnostic images kept
  after each score run; agent told to Read them.
- `--no-visual`: images deleted after scoring and `Read(**/*.png|jpg|pdf)`
  disallowed; agent sees only compile logs + numeric metrics.

Final grading always re-runs the official comparator on `output.typ`
(agent can't game its own score).

### Harness v2 (`--harness v2`; v1 remains the default)

Same loop plus, via `feedback_v2.py`:

- **Best-so-far checkpointing**: `score.sh` snapshots `output.typ` to
  `feedback/best/` whenever overall improves; final grading takes
  max(last edit, best checkpoint).
- **`./sweep.sh 'margin=1.5cm,2cm' 'fontsize=9pt,10pt'`**: deterministic grid
  search over `typst --input` values (output.typ reads them via
  `sys.inputs`), ranked by official score; replaces manual nudging turns.
- **Fine-grained score report** (existing pdf_fidelity_v0.1 numbers, no new
  metrics): all content/layout/typography subcomponents, pagination split
  into page-count vs same-page-word parts, and per-page lines (word-geometry
  mean, displaced/moved/missing/extra word counts, raster ink/edge/ssim).
- **Registered-raster diagnostic**: official raster recomputed after best
  global per-page shift (phase correlation) — reported alongside, never part
  of the official score; tells the agent whether raster is misalignment or
  the font-rendering floor.

```bash
# smoke-tested: --setup-only + score.sh reproduce baseline scores exactly
python3 run_task.py 05_tables_simple_023 --visual            # spends API budget
python3 run_task.py 05_tables_simple_023 --no-visual
```

## What to run (proposed matrix, ~$40 ceiling)

1. **Pilot (2 samples × 2 modes, sonnet, $3 cap each):**
   `05_tables_simple_023`, `07_figures_captions_007` — validates the loop and
   gives an early visual-vs-blind read. (~$12)
2. **Core (remaining 4 hard samples × best mode from pilot, sonnet):** (~$12)
3. **Candidate comparison on the single hardest sample**
   (`06_tables_moderate_010`, both modes): sonnet vs opus (`--model opus`),
   to pick "best possible candidate on the hardest challenge". (~$12)
4. Repeats for noise on one sample (2×). (~$6)

Not run yet — each `run_task.py` invocation without `--setup-only` spends
Anthropic API budget; per project guardrails, paid runs need explicit
user go-ahead.
