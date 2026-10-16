#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, first-line-indent: 15pt, leading: 2.6pt)

#show heading.where(level: 1): it => {
  v(16.8pt, weak: false)
  block(above: 0pt, below: 0pt)[
    #text(size: 14.4pt, weight: "bold")[1#h(8pt)#it.body]
  ]
  v(9.6pt, weak: false)
}

// Title block matching LaTeX \maketitle for 11pt article
#v(35pt)
#align(center)[
  #text(size: 17.28pt)[On the Dynamics of Light Wilson Quarks]
  #v(16.5pt)
  #text(size: 12pt)[Source-backed arXiv sample]
]
#v(27.5pt)

= Figure Captions

// Figure with placeholder box; height matches LaTeX \fbox outer height:
// 1.15in inner + 2*fboxsep(3pt) + 2*fboxrule(0.4pt) = 1.15in + 6.8pt = 89.6pt
#align(center)[
  #box(stroke: 0.4pt, inset: 3pt, width: 78%, height: 89.6pt)
]

#v(10pt)

// Full-width caption matching LaTeX \abovecaptionskip=10pt
#block(width: 100%)[
  #set text(size: 10pt)
  #set par(first-line-indent: 0pt, justify: true, leading: 2pt)
  Figure~1: Time history of the effective pion mass (distance \$8\$) for \$\\beta=5.30\$ and \$\\kappa=0.1677\$ on a \$16^3\\times 32\$ lattice. Symbols are: (\$\\times\$) HMC at \$\\delta\\tau=0.0069\$, (\$+\$) HMD at \$\\delta\\tau=0.0069\$, (\$\\bigcirc\$) HMD at \$\\delta\\tau=0.004\$. Also shown is the blocksize\$=40\$ (\$\\Diamond\$) HMC acceptance uncorrected for autocorrelations.
]

#v(12pt)

#h(15pt)Figures~1 through~1 preserve source-backed captions while replacing external graphics with deterministic placeholders.
