#set page(paper: "us-letter", margin: 1in)
#set text(font: ("Latin Modern Roman", "New Computer Modern"), size: 11pt)
#set par(justify: true, leading: 0.55em, first-line-indent: 0pt)

#set heading(numbering: "1")
#show heading.where(level: 1): it => {
  v(1.55em, weak: true)
  text(size: 14.4pt, weight: "bold")[
    #counter(heading).display("1")
    #h(1em)
    #it.body
  ]
  v(1.0em, weak: true)
}

#show figure.caption: it => [
  #it.supplement #context it.counter.display(it.numbering): #it.body
]

// maketitle structure from LaTeX article class
#pad(top: 2em)[
  #align(center)[
    #text(size: 17.28pt, weight: "bold")[On the Dynamics of Light Wilson Quarks]
    #v(1.5em)
    #text(size: 12pt)[Source-backed arXiv sample]
    #v(1em)
  ]
]
#v(1.5em)

= Figure Captions

#figure(
  rect(width: 0.78 * 100%, height: 1.15in, stroke: 0.4pt),
  caption: [Time history of the effective pion mass (distance \$8\$) for \$\\beta=5.30\$ and \$\\kappa=0.1677\$ on a \$16^3\\times 32\$ lattice. Symbols are: (\$\\times\$) HMC at \$\\delta\\tau=0.0069\$, (\$+\$) HMD at \$\\delta\\tau=0.0069\$, (\$\\bigcirc\$) HMD at \$\\delta\\tau=0.004\$. Also shown is the blocksize\$=40\$ (\$\\Diamond\$) HMC acceptance uncorrected for autocorrelations.],
) <fig:source-1>

Figures~1 through~1 preserve source-backed captions while replacing external graphics with deterministic placeholders.
