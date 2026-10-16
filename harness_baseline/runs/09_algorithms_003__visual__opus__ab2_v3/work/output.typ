#let margin = sys.inputs.at("margin", default: "1in")
#let fontsize = eval(sys.inputs.at("fontsize", default: "11pt"))

#set page(paper: "us-letter", margin: eval(margin), numbering: "1")
#set text(font: "New Computer Modern", size: fontsize)
#set par(justify: true, leading: 0.62em)

// Title block
#align(center)[
  #v(16pt)
  #text(size: 20.74pt)[Algorithmic Pseudocode Sample 3]
  #v(14pt)
  #text(size: 14.4pt)[Source-backed Image2Struct algorithm sample]
  #v(30pt)
]

= Algorithm

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#pagebreak()

// ---- Algorithm block ----
#let algleading = eval(sys.inputs.at("algleading", default: "0.85em"))
#let algspacing = eval(sys.inputs.at("algspacing", default: "0.68em"))
#set par(justify: false, leading: algleading, spacing: algspacing)

#let ind = 1.7em
#let kw(s) = strong(s)
#let cm(c) = box(width: 1fr)[#h(1fr) $triangle.stroked.small$ #c]

#let ln(lv, body, cmt: none) = pad(left: lv * ind)[
  #if cmt == none [#body] else [#body#cm(cmt)]
]

#v(10pt)
#line(length: 100%, stroke: 0.9pt)
#v(-0.55em)
#line(length: 100%, stroke: 0.4pt)
#v(0.15em)
*Algorithm 2* Initialization of the control and state variables
#v(0.15em)
#line(length: 100%, stroke: 0.4pt)
#v(0.35em)

#set text(size: fontsize)

#ln(0, [#kw[for] $t in {-1, dots, -T^(t r a c e b a c k)}$ #kw[do]], cmt: [Retrieve the values of $P_(u,t)$])
#ln(1, [$P_(u,t) <- upright(mono("Power.GetValue"))(t)$])
#ln(0, [#kw[end for]])
#ln(0, [#kw[for] $t in {-1, dots, -T^(t r a c e b a c k)}$ #kw[do]], cmt: [Initial conditions on the state variables])
#ln(1, [#kw[if] $P_(u,t) > upright(mono("MinimumPower.GetValue"))(t)$ #kw[then]])
#ln(2, [$S_(u,t)^(O F F) <- 0$])
#ln(2, [$S_(u,t)^(S T O P) <- 0$])
#ln(2, [$S_(u,t)^(S T A R T) <- 0$])
#ln(2, [#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]], cmt: [Exact initialization required only if the FLAT state is defined.])
#ln(3, [$S_(t-1)^(O N \_ U P) <- 0$])
#ln(3, [$S_(t-1)^(O N \_ D O W N) <- 1$])
#ln(3, [$S_(t-1)^(O N \_ F L A T) <- 0$])
#ln(2, [#kw[else if] $P_(u,t) > P_(u,t-1)$ #kw[then]])
#ln(3, [$S_(t-1)^(O N \_ U P) <- 1$])
#ln(3, [$S_(t-1)^(O N \_ D O W N) <- 0$])
#ln(3, [$S_(t-1)^(O N \_ F L A T) <- 0$])
#ln(2, [#kw[else if] $P_(u,t) = P_(u,t-1)$ #kw[then]])
#ln(3, [$S_(t-1)^(O N \_ U P) <- 0$])
#ln(3, [$S_(t-1)^(O N \_ D O W N) <- 0$])
#ln(3, [$S_(t-1)^(O N \_ F L A T) <- 1$])
#ln(2, [#kw[end if]])
#ln(1, [#kw[else if] $P_(u,t) > 0$ #kw[then]], cmt: [Reconstruct the startups and shutdowns])
#ln(2, [#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]])
#ln(3, [$S_(t)^(S T O P) <- 1$])
#ln(3, [$S_(t)^(S T A R T) <- 0$])
#ln(2, [#kw[else]])
#ln(3, [$S_(t)^(S T O P) <- 0$])
#ln(3, [$S_(t)^(S T A R T) <- 1$])
#ln(2, [#kw[end if]])
#ln(1, [#kw[else]], cmt: [Final possibility: the unit is OFF.])
#ln(2, [$S_(u,t)^(O F F) <- 1$])
#ln(2, [$S_(u,t)^(S T O P) <- 0$])
#ln(2, [$S_(u,t)^(S T A R T) <- 0$])
#ln(2, [$S_(t-1)^(O N \_ U P) <- 0$])
#ln(2, [$S_(t-1)^(O N \_ D O W N) <- 0$])
#ln(2, [$S_(t-1)^(O N \_ F L A T) <- 0$])
#ln(1, [#kw[end if]])
#ln(0, [#kw[end for]])

#v(0.35em)
#line(length: 100%, stroke: 0.4pt)
#v(-0.55em)
#line(length: 100%, stroke: 0.9pt)

