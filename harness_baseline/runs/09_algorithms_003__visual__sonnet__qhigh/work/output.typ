#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1")

#show heading.where(level: 1): it => {
  v(1.2em, weak: true)
  block(above: 0pt, below: 0.6em,
    text(size: 14pt, weight: "bold")[
      #counter(heading).display()#h(0.7em)#it.body
    ]
  )
}

// Title block matching LaTeX \maketitle for 11pt article
#v(39pt)
#align(center)[
  #text(size: 17pt)[Algorithmic Pseudocode Sample 3]
  #v(1.5em)
  #text(size: 12pt)[Source-backed Image2Struct algorithm sample]
]
#v(1.5em)

= Algorithm

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#pagebreak()

// Vertical centering: LaTeX float pages use \@fptop=0pt+1fil, \@fpbot=0pt+1fil
#v(1fr)

#let ps = 2.4pt  // per-line spacing below each block

#let pline(ind, code) = {
  block(width: 100%, above: 0pt, below: ps,
    h(ind * 1.5em) + code
  )
}

#let cline(ind, code, cmt) = {
  block(width: 100%, above: 0pt, below: ps,
    grid(columns: (1fr, auto), align: (left, right), gutter: 0pt,
      h(ind * 1.5em) + code,
      [$triangle.r$ #cmt]
    )
  )
}

#let kw(t) = text(weight: "bold")[#t]

// Superscript text with underscore helper
#let sup(s) = text(s)

// Algorithm 2 box
#line(length: 100%, stroke: 0.8pt)
#v(2pt)
#block(width: 100%, above: 0pt, below: 2pt)[
  *Algorithm 2* #h(0.5em)Initialization of the control and state variables
]
#line(length: 100%, stroke: 0.4pt)
#v(3pt)

#set par(justify: false, leading: 0pt)

#cline(0,
  [#kw[for] $t in {-1, dots, -T^"traceback"}$ #kw[do]],
  [Retrieve the values of $P_(u,t)$]
)
#pline(1, [$P_(u,t) arrow.l$ #raw("Power.GetValue")$(t)$])
#pline(0, kw[end for])

#cline(0,
  [#kw[for] $t in {-1, dots, -T^"traceback"}$ #kw[do]],
  [Initial conditions on the state variables]
)
#pline(1, [#kw[if] $P_(u,t) >$ #raw("MinimumPower.GetValue")$(t)$ #kw[then]])
#pline(2, [$S_(u,t)^"OFF" arrow.l 0$])
#pline(2, [$S_(u,t)^"STOP" arrow.l 0$])
#pline(2, [$S_(u,t)^"START" arrow.l 0$])

#cline(2,
  [#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]],
  [Exact initialization required only if the FLAT state is defined.]
)
#pline(3, [$S_(t-1)^("ON_UP") arrow.l 0$])
#pline(3, [$S_(t-1)^("ON_DOWN") arrow.l 1$])
#pline(3, [$S_(t-1)^("ON_FLAT") arrow.l 0$])

#pline(2, [#kw[else if] $P_(u,t) > P_(u,t-1)$ #kw[then]])
#pline(3, [$S_(t-1)^("ON_UP") arrow.l 1$])
#pline(3, [$S_(t-1)^("ON_DOWN") arrow.l 0$])
#pline(3, [$S_(t-1)^("ON_FLAT") arrow.l 0$])

#pline(2, [#kw[else if] $P_(u,t) = P_(u,t-1)$ #kw[then]])
#pline(3, [$S_(t-1)^("ON_UP") arrow.l 0$])
#pline(3, [$S_(t-1)^("ON_DOWN") arrow.l 0$])
#pline(3, [$S_(t-1)^("ON_FLAT") arrow.l 1$])

#pline(2, kw[end if])

#cline(1,
  [#kw[else if] $P_(u,t) > 0$ #kw[then]],
  [Reconstruct the startups and shutdowns]
)
#pline(2, [#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]])
#pline(3, [$S_t^"STOP" arrow.l 1$])
#pline(3, [$S_t^"START" arrow.l 0$])
#pline(2, kw[else])
#pline(3, [$S_t^"STOP" arrow.l 0$])
#pline(3, [$S_t^"START" arrow.l 1$])
#pline(2, kw[end if])

#cline(1,
  kw[else],
  [Final possibility: the unit is OFF.]
)
#pline(2, [$S_(u,t)^"OFF" arrow.l 1$])
#pline(2, [$S_(u,t)^"STOP" arrow.l 0$])
#pline(2, [$S_(u,t)^"START" arrow.l 0$])
#pline(2, [$S_(t-1)^("ON_UP") arrow.l 0$])
#pline(2, [$S_(t-1)^("ON_DOWN") arrow.l 0$])
#pline(2, [$S_(t-1)^("ON_FLAT") arrow.l 0$])

#pline(1, kw[end if])
#pline(0, kw[end for])

#v(3pt)
#line(length: 100%, stroke: 0.8pt)

#v(1fr)
