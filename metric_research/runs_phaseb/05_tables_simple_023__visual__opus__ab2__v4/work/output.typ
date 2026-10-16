#set page(paper: "us-letter", margin: 1in, numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.62em)
#show figure.where(kind: table): set figure.caption(position: top)
#set heading(numbering: "1")

// micro-sign subscript cell (extracts as "µ"+sub, e.g. "µxin")
#let mm(s) = box[#text(style: "italic")[µ]#sub(text(style: "italic")[#s])]

// resizebox{\linewidth}{!} equivalent: scale body so its width == available width
#let fitwidth(body) = layout(size => {
  let m = measure(body)
  let f = size.width / m.width
  box(scale(x: f * 100%, y: f * 100%, reflow: true, body))
})

// ---- title block (\maketitle) ----
#v(1.5em)
#align(center)[
  #text(size: 17.28pt)[Simple Tables]
  #v(1.6em)
  #text(size: 12pt)[Source-backed grouped table sample]
]
#v(3em)

= Tables

These tables are grouped from source-backed LaTeX table data and compiled as a single benchmark data point.

#pagebreak()

#v(2.1in)

#figure(
  caption: [Source table 1: 2512.03307\_table\_5],
  kind: table,
  supplement: [Table],
  fitwidth(
    table(
      columns: 11,
      stroke: none,
      inset: (x: 6pt, y: 3pt),
      align: center + horizon,
      table.hline(y: 0),
      table.vline(x: 0), table.vline(x: 1), table.vline(x: 11),
      [max-min iter.], mm[l], mm[h], mm[xin], mm[zx], mm[rs], mm[c], mm[a], mm[rcat], mm[m], mm[d],
      table.hline(y: 1),
      [1], [5], [10], [3], [5], [1.0], [8], [tanh], [0.9], [0.4], [uniform],
      [2], [3], [5], [2], [5], [0.1], [2], [identity], [1.0], [0.4], [uniform],
      [3], [12], [128], [13], [200], [0.0], [2], [identity], [0.4], [0.0], [uniform],
      [4], [3], [5], [2], [6], [0.6], [2], [tanh], [1.0], [0.0], [exponential],
      [5], [10], [64], [8], [32], [0.4], [2], [tanh], [1.0], [0.0], [uniform],
      [6], [8], [32], [5], [13], [0.8], [10], [identity], [0.0], [0.2], [normal],
      [7], [10], [64], [8], [162], [0.9], [6], [elu], [0.6], [0.0], [normal],
      [8], [5], [10], [3], [13], [0.0], [10], [tanh], [0.8], [0.0], [uniform],
      [9], [5], [10], [3], [5], [0.3], [6], [identity], [0.6], [0.0], [exponential],
      [10], [5], [10], [3], [5], [0.1], [10], [tanh], [0.5], [0.0], [normal],
      [11], [3], [5], [2], [5], [0.0], [8], [relu], [1.0], [0.0], [normal],
      [12], [3], [5], [2], [5], [0.6], [4], [relu], [0.6], [0.0], [exponential],
      [13], [3], [5], [2], [5], [0.4], [6], [tanh], [0.6], [0.0], [normal],
      [14], [5], [10], [3], [5], [0.8], [8], [identity], [0.8], [0.0], [exponential],
      [15], [3], [5], [2], [5], [1.0], [8], [elu], [0.6], [0.0], [uniform],
      [16], [3], [5], [2], [6], [0.7], [6], [identity], [0.3], [0.0], [uniform],
      [17], [8], [32], [5], [91], [0.0], [2], [tanh], [1.0], [0.0], [exponential],
      [18], [3], [5], [2], [5], [0.0], [8], [tanh], [1.0], [0.0], [exponential],
      [19], [3], [5], [2], [6], [0.2], [6], [tanh], [0.2], [0.0], [exponential],
      [20], [12], [128], [13], [200], [0.2], [2], [identity], [0.1], [0.0], [exponential],
      [21], [3], [5], [2], [6], [0.9], [8], [relu], [0.6], [0.0], [exponential],
      [22], [3], [5], [2], [5], [0.3], [8], [identity], [0.2], [0.0], [uniform],
      [23], [5], [10], [3], [5], [0.2], [4], [tanh], [0.3], [0.0], [normal],
      [24], [3], [5], [2], [5], [0.8], [8], [identity], [0.1], [0.0], [uniform],
      [25], [3], [5], [2], [5], [0.2], [4], [relu], [1.0], [0.0], [exponential],
      [26], [3], [5], [2], [5], [0.5], [8], [tanh], [0.8], [0.0], [normal],
      [27], [8], [32], [5], [13], [0.1], [4], [identity], [0.0], [0.0], [exponential],
      [28], [3], [5], [2], [6], [0.4], [4], [tanh], [0.1], [0.0], [exponential],
      [29], [3], [5], [2], [5], [0.1], [8], [identity], [0.2], [0.0], [exponential],
      table.hline(y: 30),
    )
  ),
)

#let sc(x) = smallcaps(x)

#pagebreak()

#figure(
  caption: [Source table 2: 2512.02195\_table\_6],
  kind: table,
  supplement: [Table],
  block(clip: true, height: 8.8in, width: 100%, fitwidth(
    table(
      columns: 4,
      stroke: none,
      inset: (x: 6pt, y: 3pt),
      align: left + horizon,
      table.hline(y: 0),
      [\#], [Word type], text(style: "italic")[f], [],
      table.hline(y: 1),
      [1.], [#emph[te] (‘at’, ‘to’, #sc[comp])], [1018], [],
      [2.], [#emph[dat] (‘that’)], [658], [],
      [3.], [#emph[niet] (‘not’)], [650], [],
      [4.], [#emph[om] (‘to’)], [446], [],
      [5.], [#emph[de] (‘the’, #sc[masc/fem/pl])], [291], [],
      [6.], [#emph[er] (‘there’)], [271], [],
      [7.], [#emph[geen] (‘no’)], [270], [],
      [8.], [#emph[elk] (‘every’, #sc[neut])], [251], [],
      [9.], [#emph[iedere] (‘every’, #sc[masc/fem])], [247], [],
      [10.], [#emph[of] (‘or’, ‘whether’)], [244], [],
      [11.], [#emph[elke] (‘every’, #sc[masc/fem])], [229], [],
      [12.], [#emph[ieder] (‘every’, #sc[neut])], [223], [],
      [13.], [#emph[alle] (‘all’)], [215], [],
      [14.], [#emph[een] (‘a’, ‘one’)], [212], [],
      [15.], [#emph[ik] (‘I’)], [194], [],
      [16.], [#emph[massa's] (‘masses’)], [186], [],
      [17.], [#emph[het] (‘the’, #sc[neut:sg])], [180], [],
      [18.], [#emph[op] (‘on’)], [178], [],
      [19.], [#emph[deze] (‘this’, #sc[masc/fem])], [172], [],
      [20.], [#emph[weinig] (‘a few’)], [171], [],
      [21.], [#emph[daar] (‘there’)], [163], [],
    )
  )),
)
