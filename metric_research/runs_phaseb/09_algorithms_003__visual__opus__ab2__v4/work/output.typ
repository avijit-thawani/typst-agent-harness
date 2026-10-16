#set page(
  paper: "us-letter",
  margin: 1in,
  numbering: "1",
  number-align: center,
)
#set text(font: "New Computer Modern", size: 11pt, lang: "en")
#set par(justify: true, leading: 0.55em)
#set heading(numbering: "1")
#show heading: set block(above: 1.4em, below: 0.9em)

// ---- Title block ----
#v(48pt)
#align(center)[
  #text(size: 20.74pt)[Algorithmic Pseudocode Sample 3]
  #v(18pt)
  #text(size: 14.4pt)[Source-backed Image2Struct algorithm sample]
]
#v(36pt)

= Algorithm

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#pagebreak()

// ---- helpers ----
#let it(x) = text(style: "italic")[#x]
#let Pv(s) = box[#it("P")#sub[#it(s)]]
#let Tt = box[#it("T")#super[#it("traceback")]]
#let S(sup, sub, val) = $upright("S")^(upright(sup))_(upright(sub)) <- upright(val)$
#let kw(s) = strong(s)

#let ind = 1.4em
#let al(lvl, body, ..rest) = block(
  above: 0.62em, below: 0.62em, breakable: false,
  {
    h(lvl * ind)
    box(width: 100% - lvl * ind, {
      body
      if rest.pos().len() > 0 {
        h(1fr)
        box[▷#rest.pos().at(0)]
      }
    })
  }
)

// ---- Algorithm float ----
#v(6pt)
#line(length: 100%, stroke: 0.9pt)
#v(-0.5em)
#line(length: 100%, stroke: 0.6pt)
#v(2pt)
*Algorithm 2* Initialization of the control and state variables
#v(-0.3em)
#line(length: 100%, stroke: 0.6pt)
#v(2pt)

#al(0)[#kw("for") #it("t") ∈{−1, . . . , −#Tt} #kw("do")][Retrieve the values of #Pv("u,t")]
#al(1)[#Pv("u,t") ←#box[#text(font: "DejaVu Sans Mono", size: 10pt)[Power.GetValue]#it("(t)")]]
#al(0)[#kw("end for")]
#al(0)[#kw("for") #it("t") ∈{−1, . . . , −#Tt} #kw("do")][Initial conditions on the state variables]
#al(1)[#kw("if") #Pv("u,t") > #box[#text(font: "DejaVu Sans Mono", size: 10pt)[MinimumPower.GetValue]#it("(t)")] #kw("then")]
#al(2)[#S("OFF", "u,t", "0")]
#al(2)[#S("STOP", "u,t", "0")]
#al(2)[#S("START", "u,t", "0")]
#al(2)[#kw("if") #Pv("u,t") < #Pv("u,t−1") #kw("then")][Exact initialization required only if the FLAT state is defined.]
#al(3)[#S("ON_UP", "t−1", "0")]
#al(3)[#S("ON_DOWN", "t−1", "1")]
#al(3)[#S("ON_FLAT", "t−1", "0")]
#al(2)[#kw("else if") #Pv("u,t") > #Pv("u,t−1") #kw("then")]
#al(3)[#S("ON_UP", "t−1", "1")]
#al(3)[#S("ON_DOWN", "t−1", "0")]
#al(3)[#S("ON_FLAT", "t−1", "0")]
#al(2)[#kw("else if") #Pv("u,t") = #Pv("u,t−1") #kw("then")]
#al(3)[#S("ON_UP", "t−1", "0")]
#al(3)[#S("ON_DOWN", "t−1", "0")]
#al(3)[#S("ON_FLAT", "t−1", "1")]
#al(2)[#kw("end if")]
#al(1)[#kw("else if") #Pv("u,t") > 0 #kw("then")][Reconstruct the startups and shutdowns]
#al(2)[#kw("if") #Pv("u,t") < #Pv("u,t−1") #kw("then")]
#al(3)[#S("STOP", "t", "1")]
#al(3)[#S("START", "t", "0")]
#al(2)[#kw("else")]
#al(3)[#S("STOP", "t", "0")]
#al(3)[#S("START", "t", "1")]
#al(2)[#kw("end if")]
#al(1)[#kw("else")][Final possibility: the unit is OFF.]
#al(2)[#S("OFF", "u,t", "1")]
#al(2)[#S("STOP", "u,t", "0")]
#al(2)[#S("START", "u,t", "0")]
#al(2)[#S("ON_UP", "t−1", "0")]
#al(2)[#S("ON_DOWN", "t−1", "0")]
#al(2)[#S("ON_FLAT", "t−1", "0")]
#al(1)[#kw("end if")]
#al(0)[#kw("end for")]

#v(2pt)
#line(length: 100%, stroke: 0.9pt)
