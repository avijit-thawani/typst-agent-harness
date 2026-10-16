#let margin = sys.inputs.at("margin", default: "1in")
#let fontsize = eval(sys.inputs.at("fontsize", default: "11pt"))
#let t1size = eval(sys.inputs.at("t1size", default: "7pt"))
#let t1insy = eval(sys.inputs.at("t1insy", default: "2.4pt"))
#let topv = eval(sys.inputs.at("topv", default: "0.55in"))
#let t2size = eval(sys.inputs.at("t2size", default: "11pt"))

#set page(paper: "us-letter", margin: eval(margin), numbering: "1")
#set text(font: "New Computer Modern", size: fontsize)
#set par(leading: 0.55em, justify: true)

#let mc(..args) = {
  set align(center)
  stack(dir: ttb, spacing: 0.35em, ..args.pos())
}

// Title block
#v(topv)
#align(center)[
  #text(size: 21pt)[Moderate Tables]
  #v(0.6em)
  #text(size: 15pt)[Source-backed grouped table sample]
]
#v(1.8em)

= Tables
These tables are grouped from source-backed LaTeX table data and compiled as a single benchmark data point.

#v(0.8em)

// ---------- Table 1 ----------
#align(center)[
  #text(size: fontsize)[Table 1: Source table 1: 2512.03369\_table\_1]
  #v(0.4em)
  #text(size: t1size)[
    #set table(inset: (x: 3pt, y: t1insy), stroke: none)
    #let hl = table.hline(stroke: 0.5pt)
    #let hb = table.hline(stroke: 1.2pt)
    #table(
      columns: (auto,) * 10,
      align: (col, row) => if col == 0 { center } else { center } + horizon,
      table.vline(x: 1, stroke: 0.5pt),
      hb,
      [*Dataset*], [*Coverage*], [*Task*], mc([*Spa.*],[*Reso.*]), mc([*Temp.*],[*Reos.*]), mc([*Areas*],[*(km#super[2])*]), [*Period*], [*Fig/Video*], [*Device*], [*Mod.*],
      hb,
      [Sim2Real-Fire], [Worldwide], mc([Fire Mask Forecast],[Fire Mask Backtrack]), [30 m], [1 hour], [20,000,000], [2013-2023], [Fig], [Satellite], [5], hl,
      [FireSpreadTS], [USA], mc([Fire Mask Forecast],[Fire Mask Backtrack]), [375 m], [1 day], [9,834,000], [2018-2021], [Fig], [Satellite], [4], hl,
      [Mesogeos], [Mediterranean], mc([Fire Mask Forecast],[Danger Forecast]), [1000 m], [1 day], [9,000,999], [2006-2022], [Fig], [Satellite], [4], hl,
      [FireDB], [USA], [Fire Intensity Forecast], [375 m], [1 day], [9,834,000], [2012-2017], [Fig], [Satellite], [4], hl,
      [Next Day fire], [USA], [Fire Mask Forecast], [1 km], [1 day], [9,834,000], [2012-2020], [Fig], [Satellite], [4], hl,
      [SeasFire Cube], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [4], hl,
      [CFSDS], [Canada], [Fire Behavior], [180 m], [1 day], [9,985,000], [2002–2021], [Fig], [Satellite], [4], hl,
      [BA-ONFIRE], [Worldwide], [Fire Behavior], [111 km], [1 month], [149,000,000], [1950-2021], [Fig], [Satellite], [1], hl,
      [GlobFire], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [1], hl,
      [Re-FWI], [Canada], [Fire Behavior], [80 km], [1 day], [9,985,000], [1980-2018], [Fig], [Satellite], [7], hl,
      [GFBS], [Worldwide], [Fire Behavior], [30 m], [16 days], [149,000,000], [2003-2016], [Fig], [Satellite], [1], hl,
      [FPA FOD-A], [USA], [Fire Behavior], [4 km], [1 day], [9,834,000], [1992-2020], [Fig], [Satellite], [4], hl,
      [GFED5], [Worldwide], [Fire Behavior], [500 m], [1 month], [149,000,000], [1997-2020], [Fig], [Satellite], [1], hl,
      [CloCAB], [Worldwide], [Fire Behavior], [27.7 km], [1 month], [149,000,000], [2002-2020], [Fig], [Satellite], [3], hl,
      [PT-FireSprd], [Portugal], mc([Fire Behavior],[Fire Mask Forecast],[Danger Forecast]), [4 km], [14 hours], [92,150], [2015-2021], [Fig], [Satellite], [1], hl,
      [NSMC-H8], [China], [Fire Monitoring], [3 km], [1 hour], [9,597,000], [2019-2021], [Fig], [Satellite], [1], hl,
      [WCU-US], [Western USA], [Danger Forecast], [250 m], [5 weeks], [4,200,000], [2005-2017], [Fig], [Satellite], [1], hl,
      [ECUF], [Regions in South Korea], mc([Danger Forecast],[Casualty Prediction]), [1 km], [1 month], [605], [2017-2021], [Fig], [Satellite], [5], hl,
      [LCLQ], [Regions in China], [Danger Forecast], [500 m], [12 hour], [16,411], [2015-2020], [Fig], [Satellite], [4], hl,
      [CaBuAr], [Regions in USA], [Fire Mask Forecast], [20 m], [1 year], [450,000], [2015-2022], [Fig], [Satellite], [1], hl,
      [GABAM], [Worldwide], [Fire Behavior], [30 m], [1 year], [149,000,000], [1990-2021], [Fig], [Satellite], [1], hl,
      [Fire Atlas], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2003-2016], [Fig], [Satellite], [1], hl,
      [MODIS], [Worldwide], mc([Fire Mask Forecast],[Danger Forecast]), [1 km], [1 day], [149,000,000], [2000-2024], [Fig], [Satellite], [3], hl,
      [VIIRS], [Worldwide], mc([Fire Mask Forecast],[Danger Forecast]), [375 m], [12 hours], [149,000,000], [2012-2024], [Fig], [Satellite], [3], hl,
      [NOAA HMS Fire], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2003-2024], [Fig], [Satellite], [3], hl,
      [NOAA HMS Smoke], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2005-2024], [Fig], [Satellite], [1], hl,
      [GOES fire], [Western Hemisphere], mc([Fire Mask Forecast],[Danger Forecast]), [2 km], [5 mins], [61,000,000], [2017-2024], [Fig], [Satellite], [4], hl,
      [NIFC WP], [USA], [Fire Mask Forecast], [2 km], [5 mins], [9,834,000], [2000-2024], [Fig], [Satellite], [1], hl,
      [FRY], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2005-2011], [Fig], [Satellite], [1], hl,
      [FireCanada], [Canada], [Fire Behavior], [1 km], [1 day], [61], [2014.8], [Fig], [Satellite], [3], hb,
      [*FireSentry*], [Regions in China], mc([Fire Video Prediction],[Infrared Video Prediction]), [*0.5 m*], [*1 s*], [0.7], [2025.2], [*Video*], [*Drone*], [4],
      hb,
    )
  ]
]

#pagebreak()

// ---------- Table 2 ----------
#v(2.35in)
#align(center)[
  #text(size: t2size)[Table 2: Source table 2: 2512.01188\_table\_1]
  #v(0.4em)
  #text(size: t2size)[
    #set table(inset: (x: 5.5pt, y: 6.5pt), stroke: none)
    #table(
      columns: 5,
      align: center + horizon,
      table.hline(stroke: 1.0pt),
      mc([Task],[Platform]), mc([Target Obs.],[Privileged Obs.]), mc([Reward],[Demos]), mc([Offline Steps],[Online Steps]), [Description],
      table.hline(stroke: 0.5pt),
      mc([Camouflage Pick],[Sim. Koch]), mc([Side Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([20K],[80K]), mc([Pick up barely],[visible object]),
      mc([Fully Obs. Pick],[Sim. xArm]), mc([Side Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([20K],[20K]), mc([Pick up fully],[visible object]),
      mc([AP Koch],[Sim. Koch]), mc([Wrist Cam],[True Obj. Pos]), mc([Sparse],[100 suboptimal]), mc([100K],[900K]), mc([Locate then pick],[up object]),
      mc([Blind Pick],[Real Koch]), mc([Joints, Init Obj. Pos],[Obj. Pos Estimate]), mc([Dense],[100 suboptimal]), mc([20K],[1.2K]), mc([Pick object from],[proprioception]),
      mc([Bookshelf-P],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$~$150 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
      mc([Bookshelf-D],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$~$100 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
      mc([Shelf-Cabinet],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$~$30 suboptimal]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
      mc([Complex],[Real Franka]), mc([Wrist Cam, Joints],[Bbox, Mask]), mc([Dense],[$~$50 expert]), mc([100K],[0]), mc([Look for object &],[switch to $pi_0$]),
      table.hline(stroke: 1.0pt),
    )
  ]
]
