#set page(paper: "us-letter", margin: 1in)
#set text(size: 11pt, font: "New Computer Modern")
#set par(justify: false, leading: 0.65em)

#show heading.where(level: 1): it => {
  block(above: 4em, below: 0.8em)[
    #text(size: 14.4pt, weight: "bold")[#counter(heading).display()#h(1em)#it.body]
  ]
}

#let kw(s) = text(weight: "bold", s)
#let sp1 = h(1.5em)
#let sp2 = h(3.0em)
#let sp3 = h(4.5em)

// \maketitle
#align(center)[
  #text(size: 17.28pt, weight: "bold")[Algorithmic Pseudocode Sample 3]\
  #v(1.5em)
  #text(size: 12pt)[Source-backed Image2Struct algorithm sample]
]
#v(1.5em)

= Algorithm

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#v(0.5em)

#block(
  width: 100%,
  breakable: false,
  inset: 0pt,
)[
  #line(length: 100%, stroke: 0.8pt)
  #pad(x: 0.5em, y: 3pt)[*Algorithm 1:* Source-backed algorithmic procedure]
  #line(length: 100%, stroke: 0.4pt)
  #pad(x: 0.5em, y: 4pt)[
    #set par(leading: 0.65em, spacing: 0pt)
    #kw[for] $t in {-1, dots.h, -T^"traceback"}$ #kw[do]#h(1fr)$triangle.r$ Retrieve the values of $P_(u,t)$\
    #sp1 $P_(u,t) <- upright("Power.GetValue")(t)$\
    #kw[end for]\
    #kw[for] $t in {-1, dots.h, -T^"traceback"}$ #kw[do]#h(1fr)$triangle.r$ Initial conditions on the state variables\
    #sp1 #kw[if] $P_(u,t) > upright("MinimumPower.GetValue")(t)$ #kw[then]\
    #sp2 $S_(u,t)^"OFF" <- 0$\
    #sp2 $S_(u,t)^"STOP" <- 0$\
    #sp2 $S_(u,t)^"START" <- 0$\
    #sp2 #kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]#h(1fr)$triangle.r$ Exact initialization required only if the FLAT state is defined.\
    #sp3 $S_(t-1)^"ON_UP" <- 0$\
    #sp3 $S_(t-1)^"ON_DOWN" <- 1$\
    #sp3 $S_(t-1)^"ON_FLAT" <- 0$\
    #sp2 #kw[else if] $P_(u,t) > P_(u,t-1)$ #kw[then]\
    #sp3 $S_(t-1)^"ON_UP" <- 1$\
    #sp3 $S_(t-1)^"ON_DOWN" <- 0$\
    #sp3 $S_(t-1)^"ON_FLAT" <- 0$\
    #sp2 #kw[else if] $P_(u,t) = P_(u,t-1)$ #kw[then]\
    #sp3 $S_(t-1)^"ON_UP" <- 0$\
    #sp3 $S_(t-1)^"ON_DOWN" <- 0$\
    #sp3 $S_(t-1)^"ON_FLAT" <- 1$\
    #sp2 #kw[end if]\
    #sp1 #kw[else if] $P_(u,t) > 0$ #kw[then]#h(1fr)$triangle.r$ Reconstruct the startups and shutdowns\
    #sp2 #kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]\
    #sp3 $S_t^"STOP" <- 1$\
    #sp3 $S_t^"START" <- 0$\
    #sp2 #kw[else]\
    #sp3 $S_t^"STOP" <- 0$\
    #sp3 $S_t^"START" <- 1$\
    #sp2 #kw[end if]\
    #sp1 #kw[else]#h(1fr)$triangle.r$ Final possibility: the unit is OFF.\
    #sp2 $S_(u,t)^"OFF" <- 1$\
    #sp2 $S_(u,t)^"STOP" <- 0$\
    #sp2 $S_(u,t)^"START" <- 0$\
    #sp2 $S_(t-1)^"ON_UP" <- 0$\
    #sp2 $S_(t-1)^"ON_DOWN" <- 0$\
    #sp2 $S_(t-1)^"ON_FLAT" <- 0$\
    #sp1 #kw[end if]\
    #kw[end for]
  ]
  #line(length: 100%, stroke: 0.4pt)
  #pad(x: 0.5em, y: 3pt)[*Algorithm 2:* Initialization of the control and state variables]
  #line(length: 100%, stroke: 0.8pt)
]
