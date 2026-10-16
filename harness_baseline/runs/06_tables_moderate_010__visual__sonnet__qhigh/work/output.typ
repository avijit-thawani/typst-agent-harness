#set page(paper: "us-letter", margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(leading: 0.65em)
#show figure.where(kind: table): set figure.caption(position: top)

// LaTeX \maketitle spacing for article class
#v(2em)
#align(center)[#text(size: 17pt, weight: "bold")[Moderate Tables]]
#v(1.5em)
#align(center)[#text(size: 12pt)[Source-backed grouped table sample]]
#v(2.5em)

= Tables

These tables are grouped from source-backed LaTeX table data and compiled as a single benchmark data point.

#v(0.5em)

// ── Table 1 (resizebox → 1fr for Task column fills full width) ──
#figure(
  caption: [Source table 1: 2512.03369_table\_1],
  kind: table,
)[
  #set text(size: 5.5pt)
  #table(
    columns: (auto, auto, 1fr, auto, auto, auto, auto, auto, auto, auto),
    align: center,
    stroke: none,
    inset: (x: 2.5pt, y: 2pt),

    table.vline(x: 1, stroke: 0.4pt),
    table.hline(y: 0, stroke: 0.8pt),
    table.hline(y: 1, stroke: 0.8pt),
    ..range(2, 32).map(y => table.hline(y: y, stroke: 0.4pt)),
    table.hline(y: 32, stroke: 0.8pt),

    // Header
    [*Dataset*], [*Coverage*], [*Task*],
    [*Spa. #linebreak()Reso.*], [*Temp. #linebreak()Reos.*],
    [*Areas #linebreak() (km²)*], [*Period*], [*Fig/Video*], [*Device*], [*Mod.*],

    // Data rows
    [Sim2Real-Fire], [Worldwide], [Fire Mask Forecast #linebreak() Fire Mask Backtrack], [30 m], [1 hour], [20,000,000], [2013-2023], [Fig], [Satellite], [5],
    [FireSpreadTS], [USA], [Fire Mask Forecast #linebreak() Fire Mask Backtrack], [375 m], [1 day], [9,834,000], [2018-2021], [Fig], [Satellite], [4],
    [Mesogeos], [Mediterranean], [Fire Mask Forecast #linebreak() Danger Forecast], [1000 m], [1 day], [9,000,999], [2006-2022], [Fig], [Satellite], [4],
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
    [PT-FireSprd], [Portugal], [Fire Behavior #linebreak() Fire Mask Forecast #linebreak() Danger Forecast], [4 km], [14 hours], [92,150], [2015-2021], [Fig], [Satellite], [1],
    [NSMC-H8], [China], [Fire Monitoring], [3 km], [1 hour], [9,597,000], [2019-2021], [Fig], [Satellite], [1],
    [WCU-US], [Western USA], [Danger Forecast], [250 m], [5 weeks], [4,200,000], [2005-2017], [Fig], [Satellite], [1],
    [ECUF], [Regions in South Korea], [Danger Forecast #linebreak() Casualty Prediction], [1 km], [1 month], [605], [2017-2021], [Fig], [Satellite], [5],
    [LCLQ], [Regions in China], [Danger Forecast], [500 m], [12 hour], [16,411], [2015-2020], [Fig], [Satellite], [4],
    [CaBuAr], [Regions in USA], [Fire Mask Forecast], [20 m], [1 year], [450,000], [2015-2022], [Fig], [Satellite], [1],
    [GABAM], [Worldwide], [Fire Behavior], [30 m], [1 year], [149,000,000], [1990-2021], [Fig], [Satellite], [1],
    [Fire Atlas], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2003-2016], [Fig], [Satellite], [1],
    [MODIS], [Worldwide], [Fire Mask Forecast #linebreak() Danger Forecast], [1 km], [1 day], [149,000,000], [2000-2024], [Fig], [Satellite], [3],
    [VIIRS], [Worldwide], [Fire Mask Forecast #linebreak() Danger Forecast], [375 m], [12 hours], [149,000,000], [2012-2024], [Fig], [Satellite], [3],
    [NOAA HMS Fire], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2003-2024], [Fig], [Satellite], [3],
    [NOAA HMS Smoke], [North America], [Danger Forecast], [2 km], [1 day], [24,710,000], [2005-2024], [Fig], [Satellite], [1],
    [GOES fire], [Western Hemisphere], [Fire Mask Forecast #linebreak() Danger Forecast], [2 km], [5 mins], [61,000,000], [2017-2024], [Fig], [Satellite], [4],
    [NIFC WP], [USA], [Fire Mask Forecast], [2 km], [5 mins], [9,834,000], [2000-2024], [Fig], [Satellite], [1],
    [FRY], [Worldwide], [Fire Behavior], [500 m], [1 day], [149,000,000], [2005-2011], [Fig], [Satellite], [1],
    [FireCanada], [Canada], [Fire Behavior], [1 km], [1 day], [61], [2014.8], [Fig], [Satellite], [3],
    [*FireSentry*], [Regions in China], [Fire Video Prediction #linebreak() Infrared Video Prediction], [*0.5 m*], [*1 s*], [0.7], [2025.2], [*Video*], [*Drone*], [4],
  )
]

// Force Table 2 to page 2; vertically center it (LaTeX float page behavior)
#pagebreak()
#v(1fr)

// ── Table 2 (booktabs style) ──
#figure(
  caption: [Source table 2: 2512.01188_table\_1],
  kind: table,
)[
  #table(
    columns: (auto,) * 5,
    align: center,
    stroke: none,
    inset: (x: 5pt, y: 4pt),

    table.hline(y: 0, stroke: 0.8pt),
    table.hline(y: 1, stroke: 0.5pt),
    table.hline(y: 9, stroke: 0.8pt),

    // Header
    [Task #linebreak() Platform],
    [Target Obs. #linebreak() Privileged Obs.],
    [Reward #linebreak() Demos],
    [Offline Steps #linebreak() Online Steps],
    [Description],

    // Data rows
    [Camouflage Pick #linebreak() Sim. Koch],
    [Side Cam #linebreak() True Obj. Pos],
    [Sparse #linebreak() 100 suboptimal],
    [20K #linebreak() 80K],
    [Pick up barely #linebreak() visible object],

    [Fully Obs. Pick #linebreak() Sim. xArm],
    [Side Cam #linebreak() True Obj. Pos],
    [Sparse #linebreak() 100 suboptimal],
    [20K #linebreak() 20K],
    [Pick up fully #linebreak() visible object],

    [AP Koch #linebreak() Sim. Koch],
    [Wrist Cam #linebreak() True Obj. Pos],
    [Sparse #linebreak() 100 suboptimal],
    [100K #linebreak() 900K],
    [Locate then pick #linebreak() up object],

    [Blind Pick #linebreak() Real Koch],
    [Joints, Init Obj. Pos #linebreak() Obj. Pos Estimate],
    [Dense #linebreak() 100 suboptimal],
    [20K #linebreak() 1.2K],
    [Pick object from #linebreak() proprioception],

    [Bookshelf-P #linebreak() Real Franka],
    [Wrist Cam, Joints #linebreak() Bbox, Mask],
    [Dense #linebreak() ~150 suboptimal],
    [100K #linebreak() 0],
    [Look for object & #linebreak() switch to $pi_0$],

    [Bookshelf-D #linebreak() Real Franka],
    [Wrist Cam, Joints #linebreak() Bbox, Mask],
    [Dense #linebreak() ~100 suboptimal],
    [100K #linebreak() 0],
    [Look for object & #linebreak() switch to $pi_0$],

    [Shelf-Cabinet #linebreak() Real Franka],
    [Wrist Cam, Joints #linebreak() Bbox, Mask],
    [Dense #linebreak() ~30 suboptimal],
    [100K #linebreak() 0],
    [Look for object & #linebreak() switch to $pi_0$],

    [Complex #linebreak() Real Franka],
    [Wrist Cam, Joints #linebreak() Bbox, Mask],
    [Dense #linebreak() ~50 expert],
    [100K #linebreak() 0],
    [Look for object & #linebreak() switch to $pi_0$],
  )
]

#v(1fr)
