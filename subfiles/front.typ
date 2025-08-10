#import "/template-files/inscight-template.typ": *
#set page(
    header: none,
    footer: none,
    margin: 0em,
    background: image("/covers/front2.svg", height: 100%, width: 100%, fit: "cover")
)
#set text(fill: rgb("ddd"), font: "Neuton SC")
#set par(leading: 0.2em, justify: false)
#place(
  center,
  dy: 6em,
  image("/covers/lightBanner.svg", width: 50%) + 
  // v(1em) +
  grid(
    columns: (auto, auto),
    align: center + horizon,
    gutter: 5em,
    text(size: 1.8em, weight: "bold", [The IISER Kolkata \ Science Magazine]),
    text(size: 1.8em, weight: "bold", "#4 | July 2025"),
  )
)

#set text(font: "Neuton")
#set par(leading: 0.15em, spacing: 0.25em)
#place(
  center + bottom,
  dy: -2em,
  box(width: 100% - 7em,
  grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    align: center + horizon,
    // stroke: (x,y) => if x < 2 { (right: 0.2em + white) },
    gutter: 1em,
    text(size: 1.3em, [*THROUGH THE EYES OF \ THE FOUNDING DIRECTOR* #parbreak() Interview with Prof. Dattagupta]),
    line(angle: 90deg, length: 5em, stroke: 0.2em + white),
    text(size: 1.3em, [*A CENTURY OF \ QUANTUM MECHANICS*#parbreak() From Paradoxes to Possibilities]),
    line(angle: 90deg, length: 5em, stroke: 0.2em + white),
    text(size: 1.3em, [*THE QUEST FOR THE \ SEA'S BLUE*#parbreak() Comic on the Raman Effect]),
  )
  )
)

// #place(
//   center + bottom,
//   dy: -3em,
//   text(size: 1.6em, weight: "bold", [\[#link("https://scicomm.iiserkol.ac.in")[scicomm.iiserkol.ac.in]\]]),
// )

#pagebreak()
