#set page(paper: "us-letter", margin: 1in, numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)

// Title (LaTeX \maketitle: \null\vskip 2em before title)
#v(2em)
#align(center)[
  #text(size: 17.28pt)[Algorithmic Pseudocode Sample 3]
  #v(1.5em)
  #text(size: 12pt)[Source-backed Image2Struct algorithm sample]
]
#v(1.5em)

// Section: \Large\bfseries, 3.5ex before (~15pt), 2.3ex after (~10pt)
#block(above: 15pt, below: 10pt)[
  #text(size: 14.4pt, weight: "bold")[1#h(0.6em)Algorithm]
]

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#pagebreak()

#let kw(s) = strong(s)
#let I = 1.5em

// Algorithm box
#line(length: 100%, stroke: 1.5pt)
#v(2pt)
#text(weight: "bold")[Algorithm 2] Initialization of the control and state variables
#v(2pt)
#line(length: 100%, stroke: 0.4pt)
#v(1pt)

#set par(spacing: 0em, justify: false, leading: 0.65em)
#kw[for] $t in {-1,dots.h,-T^italic("traceback")}$ #kw[do]#h(1fr)$triangle.r$ Retrieve the values of $P_(u,t)$\
#h(I)$P_(u,t) arrow.l$ `Power.GetValue`$(t)$\
#kw[end for]\
#kw[for] $t in {-1,dots.h,-T^italic("traceback")}$ #kw[do]#h(1fr)$triangle.r$ Initial conditions on the state variables\
#h(I)#kw[if] $P_(u,t) >$ `MinimumPower.GetValue`$(t)$ #kw[then]\
#h(2*I)$S_(u,t)^italic("OFF") arrow.l 0$\
#h(2*I)$S_(u,t)^italic("STOP") arrow.l 0$\
#h(2*I)$S_(u,t)^italic("START") arrow.l 0$\
#h(2*I)#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]#h(1fr)$triangle.r$ Exact initialization required only if the FLAT state is defined.\
#h(3*I)$S_(t-1)^italic("ON_UP") arrow.l 0$\
#h(3*I)$S_(t-1)^italic("ON_DOWN") arrow.l 1$\
#h(3*I)$S_(t-1)^italic("ON_FLAT") arrow.l 0$\
#h(2*I)#kw[else if] $P_(u,t) > P_(u,t-1)$ #kw[then]\
#h(3*I)$S_(t-1)^italic("ON_UP") arrow.l 1$\
#h(3*I)$S_(t-1)^italic("ON_DOWN") arrow.l 0$\
#h(3*I)$S_(t-1)^italic("ON_FLAT") arrow.l 0$\
#h(2*I)#kw[else if] $P_(u,t) = P_(u,t-1)$ #kw[then]\
#h(3*I)$S_(t-1)^italic("ON_UP") arrow.l 0$\
#h(3*I)$S_(t-1)^italic("ON_DOWN") arrow.l 0$\
#h(3*I)$S_(t-1)^italic("ON_FLAT") arrow.l 1$\
#h(2*I)#kw[end if]\
#h(I)#kw[else if] $P_(u,t) > 0$ #kw[then]#h(1fr)$triangle.r$ Reconstruct the startups and shutdowns\
#h(2*I)#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]\
#h(3*I)$S_t^italic("STOP") arrow.l 1$\
#h(3*I)$S_t^italic("START") arrow.l 0$\
#h(2*I)#kw[else]\
#h(3*I)$S_t^italic("STOP") arrow.l 0$\
#h(3*I)$S_t^italic("START") arrow.l 1$\
#h(2*I)#kw[end if]\
#h(I)#kw[else]#h(1fr)$triangle.r$ Final possibility: the unit is OFF.\
#h(2*I)$S_(u,t)^italic("OFF") arrow.l 1$\
#h(2*I)$S_(u,t)^italic("STOP") arrow.l 0$\
#h(2*I)$S_(u,t)^italic("START") arrow.l 0$\
#h(2*I)$S_(t-1)^italic("ON_UP") arrow.l 0$\
#h(2*I)$S_(t-1)^italic("ON_DOWN") arrow.l 0$\
#h(2*I)$S_(t-1)^italic("ON_FLAT") arrow.l 0$\
#h(I)#kw[end if]\
#kw[end for]

#set par(spacing: 1.2em)
#v(1pt)
#line(length: 100%, stroke: 0.4pt)
#line(length: 100%, stroke: 0.4pt)
