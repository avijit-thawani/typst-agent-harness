#let t1size = eval(sys.inputs.at("t1size", default: "6.8pt"))
#let t2size = eval(sys.inputs.at("t2size", default: "11pt"))

#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.65em)

// ===== Title block =====
#v(60pt)
#align(center)[
  #text(size: 21pt)[Moderate Tables]
  #v(14pt)
  #text(size: 14pt)[Source-backed grouped table sample]
]
#v(30pt)

// ===== Section =====
#text(size: 14.4pt, weight: "bold")[1#h(12pt)Tables]
#v(6pt)

These tables are grouped from source-backed LaTeX table data and compiled as a single benchmark data point.

#v(10pt)

// ===== Table 1 =====
#let bold(x) = text(weight: "bold")[#x]
#let mc(..a) = {
  set align(center)
  a.pos().join(linebreak())
}

#align(center)[
  Table 1: Source table 1: 2512.03369\_table\_1
]
#v(3pt)

#let thick = 1.1pt
#let thin = 0.5pt

#align(center)[
#set text(size: t1size)
#table(
  columns: (2.35fr, 2.25fr, 2.65fr, 1.05fr, 1.15fr, 1.6fr, 1.3fr, 1.35fr, 1.2fr, 0.6fr),
  inset: (x: 2pt, y: 1.4pt),
  align: center + horizon,
  stroke: (x, y) => (
    left: if x == 1 { thin } else { none },
    top: if y == 0 { thick }
      else if y == 1 { thick }
      else if y == 31 { thick }
      else { thin },
    bottom: if y == 31 { thick } else { none },
  ),
  bold[Dataset], bold[Coverage], bold[Task], bold[Spa. \ Reso.], bold[Temp. \ Reos.], bold[Areas \ (km#super[2])], bold[Period], bold[Fig/Video], bold[Device], bold[Mod.],
  [Sim2Real-Fire], [Worldwide], mc[Fire Mask Forecast][Fire Mask Backtrack], [30 m], [1 hour], [20,000,000], [2013-2023], [Fig], [Satellite], [5],
  [FireSpreadTS], [USA], mc[Fire Mask Forecast][Fire Mask Backtrack], [375 m], [1 day], [9,834,000], [2018-2021], [Fig], [Satellite], [4],
  [Mesogeos], [Mediterranean], mc[Fire Mask Forecast][Danger Forecast], [1000 m], [1 day], [9,000,999], [2006-2022], [Fig], [Satellite], [4],
  [FireDB], [USA], [Fire Intensity Forecast], [375 m], [1 day], [9,834,000], [2012-2017], [Fig], [Satellite], [4],
  [Next Day fire], [USA], [Fire Mask Forecast], [1 km], [1 day], [9,834,000], [2012-2020], [Fig], [Satellite], [4],
  [SeasFire Cube], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [4],
  [CFSDS], [Canada], [Fire Behavior], [180 m], [1 day], [9,985,000], [2002–2021], [Fig], [Satellite], [4],
  [BA-ONFIRE], [Worldwide], [Fire Behavior], [111 km], [1 month], [149,000,000], [1950-2021], [Fig], [Satellite], [1],
  [GlobFire], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2001-2017], [Fig], [Satellite], [1],
  [Re-FWI], [Canada], [Fire Behavior], [80 km], [1 day], [9,985,000], [1980-2018], [Fig], [Satellite], [7],
  [GFBS], [Worldwide], [Fire Behavior], [30 m], [16 days], [149,000,000], [2003-2016], [Fig], [Satellite], [1],
  [FPA FOD-A], [USA], [Fire Behavior], [4 km], [1 day], [9,834,000], [1992-2020], [Fig], [Satellite], [4],
  [GFED5], [Worldwide], [Fire Behavior], [500 m], [1 month], [149,000,000], [1997-2020], [Fig], [Satellite], [1],
  [CloCAB], [Worldwide], [Fire Behavior], [27.7 km], [1 month], [149,000,000], [2002-2020], [Fig], [Satellite], [3],
  [PT-FireSprd], [Portugal], mc[Fire Behavior][Fire Mask Forecast][Danger Forecast], [4 km], [14 hours], [92,150], [2015-2021], [Fig], [Satellite], [1],
  [NSMC-H8], [China], [Fire Monitoring], [3 km], [1 hour], [9,597,000], [2019-2021], [Fig], [Satellite], [1],
  [WCU-US], [Western USA], [Danger Forecast], [250 m], [5 weeks], [4,200,000], [2005-2017], [Fig], [Satellite], [1],
  [ECUF], [Regions in South Korea], mc[Danger Forecast][Casualty Prediction], [1 km], [1 month], [605], [2017-2021], [Fig], [Satellite], [5],
  [LCLQ], [Regions in China], [Danger Forecast], [500 m], [12 hour], [16,411], [2015-2020], [Fig], [Satellite], [4],
  [CaBuAr], [Regions in USA], [Fire Mask Forecast], [20 m], [1 year], [450,000], [2015-2022], [Fig], [Satellite], [1],
  [GABAM], [Worldwide], [Fire Behavior], [30 m], [1 year], [149,000,000], [1990-2021], [Fig], [Satellite], [1],
  [Fire Atlas], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2003-2016], [Fig], [Satellite], [1],
  [MODIS], [Worldwide], mc[Fire Mask Forecast][Danger Forecast], [1 km], [1 day], [149,000,000], [2000-2024], [Fig], [Satellite], [3],
  [VIIRS], [Worldwide], mc[Fire Mask Forecast][Danger Forecast], [375 m], [12 hours], [149,000,000], [2012-2024], [Fig], [Satellite], [3],
  [NOAA HMS Fire], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2003-2024], [Fig], [Satellite], [3],
  [NOAA HMS Smoke], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2005-2024], [Fig], [Satellite], [1],
  [GOES fire], [Western Hemisphere], mc[Fire Mask Forecast][Danger Forecast], [2 km], [5 mins], [61,000,000], [2017-2024], [Fig], [Satellite], [4],
  [NIFC WP], [USA], [Fire Mask Forecast], [2 km], [5 mins], [9,834,000], [2000-2024], [Fig], [Satellite], [1],
  [FRY], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2005-2011], [Fig], [Satellite], [1],
  [FireCanada], [Canada], [Fire Behavior], [1 km], [1 day], [61], [2014.8], [Fig], [Satellite], [3],
  bold[FireSentry], [Regions in China], mc[Fire Video Prediction][Infrared Video Prediction], bold[0.5 m], bold[1 s], [0.7], [2025.2], bold[Video], bold[Drone], [4],
)
]

#pagebreak()

// ===== Table 2 =====
#v(150pt)
#align(center)[
  Table 2: Source table 2: 2512.01188\_table\_1
]
#v(3pt)

#align(center)[
#set text(size: t2size)
#table(
  columns: (1.2fr, 1.55fr, 1.25fr, 1.12fr, 1.42fr),
  inset: (x: 4pt, y: 6pt),
  align: center + horizon,
  stroke: none,
  table.hline(y: 0, stroke: thin),
  mc[Task][Platform], mc[Target Obs.][Privileged Obs.], mc[Reward][Demos], mc[Offline Steps][Online Steps], [Description],
  table.hline(y: 1, stroke: thin),
  mc[Camouflage Pick][Sim. Koch], mc[Side Cam][True Obj. Pos], mc[Sparse][100 suboptimal], mc[20K][80K], mc[Pick up barely][visible object],
  mc[Fully Obs. Pick][Sim. xArm], mc[Side Cam][True Obj. Pos], mc[Sparse][100 suboptimal], mc[20K][20K], mc[Pick up fully][visible object],
  mc[AP Koch][Sim. Koch], mc[Wrist Cam][True Obj. Pos], mc[Sparse][100 suboptimal], mc[100K][900K], mc[Locate then pick][up object],
  mc[Blind Pick][Real Koch], mc[Joints, Init Obj. Pos][Obj. Pos Estimate], mc[Dense][100 suboptimal], mc[20K][1.2K], mc[Pick object from][proprioception],
  mc[Bookshelf-P][Real Franka], mc[Wrist Cam, Joints][Bbox, Mask], mc[Dense][$~$150 suboptimal], mc[100K][0], mc[Look for object &][switch to $pi_0$],
  mc[Bookshelf-D][Real Franka], mc[Wrist Cam, Joints][Bbox, Mask], mc[Dense][$~$100 suboptimal], mc[100K][0], mc[Look for object &][switch to $pi_0$],
  mc[Shelf-Cabinet][Real Franka], mc[Wrist Cam, Joints][Bbox, Mask], mc[Dense][$~$30 suboptimal], mc[100K][0], mc[Look for object &][switch to $pi_0$],
  mc[Complex][Real Franka], mc[Wrist Cam, Joints][Bbox, Mask], mc[Dense][$~$50 expert], mc[100K][0], mc[Look for object &][switch to $pi_0$],
  table.hline(stroke: thin),
)
]
