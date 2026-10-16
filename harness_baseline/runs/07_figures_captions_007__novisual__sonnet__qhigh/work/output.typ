#set page(
  paper: "us-letter",
  margin: 1in,
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

#set par(
  justify: true,
  leading: 0.65em,
)

// Section heading matching LaTeX \section at 11pt
#show heading.where(level: 1): it => {
  v(15pt)
  text(size: 14pt, weight: "bold")[#it.body]
  v(10pt)
}

#show figure.caption: set text(size: 10pt)
#set figure.caption(separator: ": ")

// LaTeX article \maketitle at 11pt: topskip=11 + vskip 2em=22 = 33pt title baseline
// Reduced from 22pt to account for Typst font ascent difference
#v(27pt)
#align(center)[
  #text(size: 17pt, weight: "bold")[On the Dynamics of Light Wilson Quarks]

  #v(16.5pt)
  #text(size: 12pt)[Source-backed arXiv sample]
]
#v(15pt)

= Figure Captions

#figure(
  placement: none,
  gap: 10pt,
  align(center, rect(width: 78%, height: 1.15in, stroke: 0.4pt)),
  caption: [Time history of the effective pion mass (distance \$8\$) for \$\u{005C}beta=5.30\$ and \$\u{005C}kappa=0.1677\$ on a \$16^3\u{005C}times 32\$ lattice. Symbols are: (\$\u{005C}times\$) HMC at \$\u{005C}delta\u{005C}tau=0.0069\$, (\$+\$) HMD at \$\u{005C}delta\u{005C}tau=0.0069\$, (\$\u{005C}bigcirc\$) HMD at \$\u{005C}delta\u{005C}tau=0.004\$. Also shown is the blocksize\$=40\$ (\$\u{005C}Diamond\$) HMC acceptance uncorrected for autocorrelations.],
) <fig-source-1>

Figures~@fig-source-1 through~@fig-source-1 preserve source-backed captions while replacing external graphics with deterministic placeholders.
