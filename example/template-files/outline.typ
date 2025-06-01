#import "constants.typ": *

#let miniOutline(minPage, maxPage) = {

  show outline.entry: set block(below: 1.5em)
  show outline.entry: it => {
    text(size: contents-size, weight: contents-weight)[
      #grid(
        columns: (25pt,1fr),
        align: (left, left),
        gutter: 3pt,
        text(weight: "bold", size: outline-main-size)[#link(
          (page: int(it.page().text), x: 0pt, y: 0pt),it.page()
        )],
        link(
          (page: int(it.page().text), x: 0pt, y: 0pt), 
          it.body()
        ),
      )
  ]
  v(1.5em)
  }

  show outline.entry: it => {
    if int(it.page().text) >= minPage and int(it.page().text) <= maxPage {
      it
    }
  }

  outline(title: none, depth: 1)
}

#let fullOutline(
  dividers: (1,),
  imagePaths: (none,),
  startFrom: 1,
) = {
  let align = "left"
  let content = for pair in dividers.zip(imagePaths, exact: true) {
    if align == "left" {
      grid(
        columns: (40%, 55%),
        align: (left + horizon, right + horizon),
        gutter: 5%,
        image(pair.at(1), fit: "cover", height: 45%),
        miniOutline(startFrom, pair.at(0))
      )
      align = "right"
    } else {
      grid(
        columns: (55%, 40%),
        align: (left + horizon, right + horizon),
        gutter: 5%,
        miniOutline(startFrom, pair.at(0)),
        image(pair.at(1), fit: "cover", height: 45%),
      )
      align = "left"
    }
    startFrom = pair.at(0) + 1
  }
  [
    = Outline<outline>

    #content
  ]
}
