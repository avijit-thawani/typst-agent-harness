#set page(paper: "us-letter", margin: 1in, numbering: "1")
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1")
#show heading: set text(size: 14.4pt)
#show figure.caption: set text(size: 11pt)
#set figure.caption(position: top)

#let thick = 1.1pt
#let thin = 0.5pt

// scale a body to full text width, like \resizebox{\linewidth}{!}{}
#let fitwidth(body) = layout(size => {
  let m = measure(body)
  let f = if m.width > 0pt { size.width / m.width } else { 1.0 }
  scale(x: f * 100%, y: f * 100%, reflow: true, body)
})

#let mc(..a) = align(center, a.pos().join([\ ]))

// ---- Title block ----
#align(center)[
  #v(48pt)
  #text(size: 20.7pt)[Moderate Tables]
  #v(18pt)
  #text(size: 14.4pt)[Source-backed grouped table sample]
  #v(24pt)
]

= Tables

These tables are grouped from source-backed LaTeX table data and compiled as a single benchmark data point.

#v(6pt)

// ================= TABLE 1 =================
#figure(
  caption: [Source table 1: 2512.03369\_table\_1],
  kind: table,
  supplement: [Table],
)[
#fitwidth(
  text(size: 9pt)[
  #table(
    columns: 10,
    align: center + horizon,
    inset: (x: 5pt, y: 3pt),
    stroke: none,
    table.hline(stroke: thick),
    table.vline(x: 1, stroke: thin),
    [*Dataset*], [*Coverage*], [*Task*], mc([*Spa.*],[*Reso.*]), mc([*Temp.*],[*Reos.*]), mc([*Areas*],[*(km#super[2])*]), [*Period*], [*Fig/Video*], [*Device*], [*Mod.*],
    table.hline(stroke: thick),
    [Sim2Real-Fire], [Worldwide], mc([Fire Mask Forecast],[Fire Mask Backtrack]), [30 m], [1 hour], [20,000,000], [2013-2023], [Fig], [Satellite], [5],
    table.hline(stroke: thin),
    [FireSpreadTS], [USA], mc([Fire Mask Forecast],[Fire Mask Backtrack]), [375 m], [1 day], [9,834,000], [2018-2021], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [Mesogeos], [Mediterranean], mc([Fire Mask Forecast],[Danger Forecast]), [1000 m], [1 day], [9,000,999], [2006-2022], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [FireDB], [USA], [Fire Intensity Forecast], [375 m], [1 day], [9,834,000], [2012-2017], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [Next Day fire], [USA], [Fire Mask Forecast], [1 km], [1 day], [9,834,000], [2012-2020], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [SeasFire Cube], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [CFSDS], [Canada], [Fire Behavior], [180 m], [1 day], [9,985,000], [2002–2021], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [BA-ONFIRE], [Worldwide], [Fire Behavior], [111 km], [1 month], [149,000,000], [1950-2021], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [GlobFire], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [Re-FWI], [Canada], [Fire Behavior], [80 km], [1 day], [9,985,000], [1980-2018], [Fig], [Satellite], [7],
    table.hline(stroke: thin),
    [GFBS], [Worldwide], [Fire Behavior], [30 m], [16 days], [149,000,000], [2003-2016], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [FPA FOD-A], [USA], [Fire Behavior], [4 km], [1 day], [9,834,000], [1992-2020], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [GFED5], [Worldwide], [Fire Behavior], [500 m], [1 month], [149,000,000], [1997-2020], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [CloCAB], [Worldwide], [Fire Behavior], [27.7 km], [1 month], [149,000,000], [2002-2020], [Fig], [Satellite], [3],
    table.hline(stroke: thin),
    [PT-FireSprd], [Portugal], mc([Fire Behavior],[Fire Mask Forecast],[Danger Forecast]), [4 km], [14 hours], [92,150], [2015-2021], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [NSMC-H8], [China], [Fire Monitoring], [3 km], [1 hour], [9,597,000], [2019-2021], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [WCU-US], [Western USA], [Danger Forecast], [250 m], [5 weeks], [4,200,000], [2005-2017], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [ECUF], [Regions in South Korea], mc([Danger Forecast],[Casualty Prediction]), [1 km], [1 month], [605], [2017-2021], [Fig], [Satellite], [5],
    table.hline(stroke: thin),
    [LCLQ], [Regions in China], [Danger Forecast], [500 m], [12 hour], [16,411], [2015-2020], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [CaBuAr], [Regions in USA], [Fire Mask Forecast], [20 m], [1 year], [450,000], [2015-2022], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [GABAM], [Worldwide], [Fire Behavior], [30 m], [1 year], [149,000,000], [1990-2021], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [Fire Atlas], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2003-2016], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [MODIS], [Worldwide], mc([Fire Mask Forecast],[Danger Forecast]), [1 km], [1 day], [149,000,000], [2000-2024], [Fig], [Satellite], [3],
    table.hline(stroke: thin),
    [VIIRS], [Worldwide], mc([Fire Mask Forecast],[Danger Forecast]), [375 m], [12 hours], [149,000,000], [2012-2024], [Fig], [Satellite], [3],
    table.hline(stroke: thin),
    [NOAA HMS Fire], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2003-2024], [Fig], [Satellite], [3],
    table.hline(stroke: thin),
    [NOAA HMS Smoke], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2005-2024], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [GOES fire], [Western Hemisphere], mc([Fire Mask Forecast],[Danger Forecast]), [2 km], [5 mins], [61,000,000], [2017-2024], [Fig], [Satellite], [4],
    table.hline(stroke: thin),
    [NIFC WP], [USA], [Fire Mask Forecast], [2 km], [5 mins], [9,834,000], [2000-2024], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [FRY], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2005-2011], [Fig], [Satellite], [1],
    table.hline(stroke: thin),
    [FireCanada], [Canada], [Fire Behavior], [1 km], [1 day], [61], [2014.8], [Fig], [Satellite], [3],
    table.hline(stroke: thick),
    [*FireSentry*], [Regions in China], mc([Fire Video Prediction],[Infrared Video Prediction]), [*0.5 m*], [*1 s*], [0.7], [2025.2], [*Video*], [*Drone*], [4],
    table.hline(stroke: thick),
  )
  ]
)
]

// ================= TABLE 2 =================
#v(2.35in)
#figure(
  caption: [Source table 2: 2512.01188\_table\_1],
  kind: table,
  supplement: [Table],
)[
#fitwidth(
  text(size: 11pt)[
  #table(
    columns: 5,
    align: center + horizon,
    inset: (x: 14pt, y: 5pt),
    stroke: none,
    table.hline(stroke: thick),
    mc([Task],[Platform]), mc([Target Obs.],[Privileged Obs.]), mc([Reward],[Demos]), mc([Offline Steps],[Online Steps]), [Description],
    table.hline(stroke: thin),
    mc([Camouflage Pick],[Sim. Koch]), mc([Side Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([20K],[80K]), mc([Pick up barely],[visible object]),
    mc([Fully Obs. Pick],[Sim. xArm]), mc([Side Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([20K],[20K]), mc([Pick up fully],[visible object]),
    mc([AP Koch],[Sim. Koch]), mc([Wrist Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([100K],[900K]), mc([Locate then pick],[up object]),
    mc([Blind Pick],[Real Koch]), mc([Joints, Init Obj. Pos],[Obj. Pos Estimate]), mc([Dense],[100 suboptimal]), mc([20K],[1.2K]), mc([Pick object from],[proprioception]),
    mc([Bookshelf-P],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$tilde$150 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
    mc([Bookshelf-D],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$tilde$100 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
    mc([Shelf-Cabinet],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$tilde$30 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
    mc([Complex],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$tilde$50 expert]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
    table.hline(stroke: thick),
  )
  ]
)
]
