#import "/template-files/inscight-template.typ": *
// #import "/dataFiles/issueConstants.typ": *
#set page(
    header: none,
    footer: none,
    margin: 0em,
    background: image("/covers/front.jpeg", height: 100%)
  )

#let size1 = 2em
#let size2 = 3em
#set par(justify: false)
#set text(fill: white, stretch: 75%, font: "Barlow") 

#let text1 = text(size: size1, pageLink(<Swarnendu-Barma>, [*Interview with \ Prof. Mustansir Barma*. pg 30]))
#let text2 = text(size: size1, pageLink(<crossword>, [*Astronomy-Themed \ Crossword*. pg 30]))
#let text3 = align(center, text(size: size2, weight: "semibold", [Temple Langurs\ Master the Art of\ Begging]) + text(size: size2, [. pg 30]))
#let banner = grid(
  rows: (15em, 5em),
  align: horizon,
  image("/covers/bannerTextWhite.png"),
  h(6em) + text(size: size2, [*\#3 | May' 25*]) + h(2em) +
  text(size: size1, link("https://scicomm.iiserkol.ac.in")[scicomm.iiserkol.ac.in])
)

#v(4em)
#grid(
  columns: (1fr, 1fr),
  align: (center, center),
  text1,
  text2
)

#place(
  center + horizon,
  dx: 8em,
  dy: -20em,
  banner
)

#place(
  bottom + right,
  dx: -10em,
  dy: -25em,
  pageLink(<Dishari-Begging>, text3)
)

#pagebreak()
