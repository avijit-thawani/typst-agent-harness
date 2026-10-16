#set page(paper: "us-letter", margin: 1in)
#set text(size: 11pt, font: "New Computer Modern")
#set par(justify: true, leading: 0.65em, spacing: 1.2em)
#set heading(numbering: "1")

// Title
#align(center)[
  #v(2em)
  #text(size: 17.28pt, weight: "bold")[Algorithmic Pseudocode Sample 3]
  #v(0.5em)
  Source-backed Image2Struct algorithm sample
  #v(1.5em)
]
#line(length: 100%, stroke: 0.4pt)
#v(0.5em)

= Algorithm

This sample contains algorithmic pseudocode extracted from a source-backed LaTeX benchmark dataset. It is wrapped in a minimal article document for pdfLaTeX validation.

#v(0.5em)

// Helpers
#let kw(t) = text(weight: "bold")[#t]
#let tt(t) = raw(t)

// Outer algorithm box
#block(
  width: 100%,
  breakable: true,
  stroke: none,
)[
  #line(length: 100%, stroke: 0.8pt)
  #v(2pt)
  #set text(size: 10pt)
  *Algorithm 1* Source-backed algorithmic procedure
  #v(3pt)
  #line(length: 100%, stroke: 0.4pt)
  #v(3pt)

  // Inner algorithm box (Algorithm 2, forced here [H])
  #block(width: 100%, breakable: true, stroke: none)[
    #line(length: 100%, stroke: 0.8pt)
    #v(2pt)

    // Pseudocode lines (1.2em par spacing between elements)
    // Line 1
    #grid(
      columns: (1fr, auto),
      [#kw[for] $t in {-1,dots.h.c,-T^"traceback"}$ #kw[do]],
      [#text(fill: gray)[▷ Retrieve the values of $P_(u,t)$]]
    )
    // Line 2
    #pad(left: 2em)[$P_(u,t) arrow.l$ #tt("Power.GetValue")$(t)$]
    // Line 3
    #kw[end for]
    // Line 4
    #grid(
      columns: (1fr, auto),
      [#kw[for] $t in {-1,dots.h.c,-T^"traceback"}$ #kw[do]],
      [#text(fill: gray)[▷ Initial conditions on the state variables]]
    )
    // Line 5
    #pad(left: 2em)[#kw[if] $P_(u,t) > $ #tt("MinimumPower.GetValue")$(t)$ #kw[then]]
    // Lines 6-8
    #pad(left: 4em)[$S_(u,t)^"OFF" arrow.l 0$]
    #pad(left: 4em)[$S_(u,t)^"STOP" arrow.l 0$]
    #pad(left: 4em)[$S_(u,t)^"START" arrow.l 0$]
    // Line 9 (with comment)
    #grid(
      columns: (1fr, auto),
      [#pad(left: 4em)[#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]]],
      [#text(fill: gray)[▷ Exact initialization required only if the FLAT state is defined.]]
    )
    // Lines 10-12
    #pad(left: 6em)[$S_(t-1)^"ON_UP" arrow.l 0$]
    #pad(left: 6em)[$S_(t-1)^"ON_DOWN" arrow.l 1$]
    #pad(left: 6em)[$S_(t-1)^"ON_FLAT" arrow.l 0$]
    // Lines 13-16
    #pad(left: 4em)[#kw[else if] $P_(u,t) > P_(u,t-1)$ #kw[then]]
    #pad(left: 6em)[$S_(t-1)^"ON_UP" arrow.l 1$]
    #pad(left: 6em)[$S_(t-1)^"ON_DOWN" arrow.l 0$]
    #pad(left: 6em)[$S_(t-1)^"ON_FLAT" arrow.l 0$]
    // Lines 17-20
    #pad(left: 4em)[#kw[else if] $P_(u,t) = P_(u,t-1)$ #kw[then]]
    #pad(left: 6em)[$S_(t-1)^"ON_UP" arrow.l 0$]
    #pad(left: 6em)[$S_(t-1)^"ON_DOWN" arrow.l 0$]
    #pad(left: 6em)[$S_(t-1)^"ON_FLAT" arrow.l 1$]
    // Line 21
    #pad(left: 4em)[#kw[end if]]
    // Line 22 (with comment)
    #grid(
      columns: (1fr, auto),
      [#pad(left: 2em)[#kw[else if] $P_(u,t) > 0$ #kw[then]]],
      [#text(fill: gray)[▷ Reconstruct the startups and shutdowns]]
    )
    // Lines 23-28
    #pad(left: 4em)[#kw[if] $P_(u,t) < P_(u,t-1)$ #kw[then]]
    #pad(left: 6em)[$S_t^"STOP" arrow.l 1$]
    #pad(left: 6em)[$S_t^"START" arrow.l 0$]
    #pad(left: 4em)[#kw[else]]
    #pad(left: 6em)[$S_t^"STOP" arrow.l 0$]
    #pad(left: 6em)[$S_t^"START" arrow.l 1$]
    // Line 29
    #pad(left: 4em)[#kw[end if]]
    // Line 30 (with comment)
    #grid(
      columns: (1fr, auto),
      [#pad(left: 2em)[#kw[else]]],
      [#text(fill: gray)[▷ Final possibility: the unit is OFF.]]
    )
    // Lines 31-36
    #pad(left: 4em)[$S_(u,t)^"OFF" arrow.l 1$]
    #pad(left: 4em)[$S_(u,t)^"STOP" arrow.l 0$]
    #pad(left: 4em)[$S_(u,t)^"START" arrow.l 0$]
    #pad(left: 4em)[$S_(t-1)^"ON_UP" arrow.l 0$]
    #pad(left: 4em)[$S_(t-1)^"ON_DOWN" arrow.l 0$]
    #pad(left: 4em)[$S_(t-1)^"ON_FLAT" arrow.l 0$]
    // Lines 37-38
    #pad(left: 2em)[#kw[end if]]
    #kw[end for]

    #v(2pt)
    #line(length: 100%, stroke: 0.4pt)
    #v(3pt)
    *Algorithm 2* Initialization of the control and state variables
  ]
  #v(2pt)
  #line(length: 100%, stroke: 0.8pt)
]
