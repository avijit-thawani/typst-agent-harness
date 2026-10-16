"""Regenerate the README figures.

Numbers are copied from harness_baseline/RESULTS.md, harness_baseline/engine_baseline_hard_set.json,
dataset_expansion/RESULTS.md and metric_research/make_report.py (Takeaways page).
Run: python figures/make_figures.py
"""
from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

OUT = Path(__file__).resolve().parent
INK, MUTED, GRID = "#1f2933", "#7b8794", "#e4e7eb"
ENGINE, ONESHOT, AGENT, BEST = "#b8c2cc", "#9fb3c8", "#4c78a8", "#e45756"

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["STIX Two Text", "Times New Roman", "DejaVu Serif"],
    "mathtext.fontset": "stix",
    "font.size": 10.5,
    "axes.edgecolor": MUTED,
    "axes.labelcolor": INK,
    "axes.spines.top": False,
    "axes.spines.right": False,
    "xtick.color": INK,
    "ytick.color": INK,
    "axes.grid": True,
    "grid.color": GRID,
    "grid.linewidth": 0.8,
    "axes.axisbelow": True,
    "savefig.dpi": 220,
    "savefig.bbox": "tight",
})


def save(fig, name):
    fig.savefig(OUT / f"{name}.png")
    fig.savefig(OUT / f"{name}.svg")
    plt.close(fig)


def hillclimb():
    rows = [
        ("TypeTeX (0/6 compile)", 0.0, ENGINE),
        ("Pandoc", 15.2, ENGINE),
        ("Tylax (1/6 fail compile)", 17.7, ENGINE),
        ("Gemini 3.1 Flash-Lite, one shot", 37.0, ONESHOT),
        ("Opus 4.7, one shot", 41.5, ONESHOT),
        ("Agentic Opus, numeric feedback only", 67.4, AGENT),
        ("Agentic Opus, visual feedback (v1)", 75.1, AGENT),
        ("+ checkpoint & sweep (v2)", 78.2, AGENT),
        ("+ raster_v0.2 in the loop (v3)", 81.6, BEST),
    ]
    fig, ax = plt.subplots(figsize=(7.2, 3.9))
    y = range(len(rows))
    ax.barh(y, [r[1] for r in rows], color=[r[2] for r in rows], height=0.62)
    for i, (_, v, _) in enumerate(rows):
        ax.text(v + 1, i, f"{v:.1f}", va="center", color=INK, fontsize=9.5)
    ax.set_yticks(list(y), [r[0] for r in rows])
    ax.invert_yaxis()
    ax.set_xlim(0, 100)
    ax.set_xlabel("Overall fidelity (0–100), 6 hardest Lathe samples")
    ax.grid(axis="y", visible=False)
    ax.set_title("From converters to an agentic harness: 37 $\\rightarrow$ 81.6", loc="left", color=INK, fontsize=12)
    fig.text(0.0, -0.04, "Engine rows scored with raster_v0.1; all others with raster_v0.2. "
             "Opus one-shot covers a subset of the 6 samples.",
             color=MUTED, fontsize=8.5)
    save(fig, "fig1_hillclimb")


def cost_vs_quality():
    pts = [
        ("Sonnet 4.6 low, numeric", 1.06, 67.2, ONESHOT, (6, -12)),
        ("Sonnet 4.6 low, visual", 1.84, 70.6, ONESHOT, (6, -3)),
        ("Opus med, numeric", 0.88, 67.4, AGENT, (6, 5)),
        ("Opus med, visual v1", 1.53, 75.1, AGENT, (6, -3)),
        ("Opus high, numeric", 2.40, 73.0, AGENT, (6, -3)),
        ("Opus high, visual", 2.58, 77.1, AGENT, (6, -3)),
        ("Opus med, visual v2", 1.30, 78.2, AGENT, (6, -3)),
        ("Opus med, visual v3", 1.18, 81.6, BEST, (6, -3)),
    ]
    fig, ax = plt.subplots(figsize=(6.4, 3.9))
    for label, c, s, col, off in pts:
        ax.scatter(c, s, s=60, color=col, edgecolor="white", linewidth=0.8, zorder=3)
        ax.annotate(label, (c, s), xytext=off, textcoords="offset points", fontsize=8.5, color=INK)
    ax.set_xlim(0.6, 3.3)
    ax.set_ylim(64, 84)
    ax.set_xlabel("Cost per conversion (USD)")
    ax.set_ylabel("Overall fidelity")
    ax.set_title("Better harness beats more compute", loc="left", color=INK, fontsize=12)
    save(fig, "fig2_cost_vs_quality")


def headroom():
    sets = [
        ("Lathe hard", 6, 8, 44.0),
        ("i2s equation", 1, 5, 57.7),
        ("i2s table", 3, 5, 68.1),
        ("i2s algorithm", 5, 5, 65.3),
        ("i2s TikZ plot", 0, 5, 0.0),
        ("PubMed table", 2, 5, 29.8),
        ("arXiv-5T paper", 1, 5, 4.1),
        ("NeurIPS paper", 0, 2, 0.0),
    ]
    fig, (a1, a2) = plt.subplots(1, 2, figsize=(8.6, 3.6), sharey=True)
    y = list(range(len(sets)))
    rate = [100 * c / n for _, c, n, _ in sets]
    a1.barh(y, rate, color=AGENT, height=0.6)
    for i, (_, c, n, _) in enumerate(sets):
        a1.text(rate[i] + 2, i, f"{c}/{n}", va="center", fontsize=9)
    a1.set_xlim(0, 115)
    a1.set_xlabel("Compiles (%)")
    a1.set_yticks(y, [s[0] for s in sets])
    a1.invert_yaxis()
    a1.grid(axis="y", visible=False)
    ov = [s[3] for s in sets]
    a2.barh(y, ov, color=[BEST if v < 30 else ONESHOT for v in ov], height=0.6)
    for i, v in enumerate(ov):
        a2.text(v + 1.5, i, "—" if v == 0 else f"{v:.1f}", va="center", fontsize=9)
    a2.set_xlim(0, 100)
    a2.set_xlabel("Overall fidelity of compiled outputs")
    a2.grid(axis="y", visible=False)
    fig.suptitle("New datasets leave lots of headroom (one-shot Sonnet 4.6)", x=0.02, ha="left",
                 color=INK, fontsize=12)
    fig.tight_layout()
    save(fig, "fig3_headroom")


def gate_feedback():
    arms = [("Starting candidate", 1.2, ENGINE), ("Scalar feedback\n(v0.1 overall)", 2.0, AGENT),
            ("Gate-first feedback\n(v2 evidence vector)", 3.2, BEST)]
    fig, ax = plt.subplots(figsize=(5.2, 3.5))
    x = range(len(arms))
    ax.bar(x, [a[1] for a in arms], color=[a[2] for a in arms], width=0.58)
    for i, (_, v, _) in enumerate(arms):
        ax.text(i, v + 0.08, f"{v:.1f} / 4", ha="center", fontsize=10, color=INK)
    ax.set_xticks(list(x), [a[0] for a in arms])
    ax.set_ylim(0, 4)
    ax.set_ylabel("Quality gates passed (avg of 6)")
    ax.grid(axis="x", visible=False)
    ax.set_title("What the agent is told matters", loc="left", color=INK, fontsize=12)
    save(fig, "fig4_gate_feedback")


if __name__ == "__main__":
    hillclimb()
    cost_vs_quality()
    headroom()
    gate_feedback()
