#import "constants.typ": *
#import "helpers.typ": *
#import "layouts.typ": *

#let miniOutline(minPage, maxPage, classes: none, split: 99999) = {
  if "int" not in classes {
    classes.int = ()
  } 
  if "cas" not in classes {
    classes.cas = ()
  } 
  if "meta" not in classes {
    classes.meta = ()
  } 

  show outline.entry: set block(below: 1.5em)
  show outline.entry: it => {
    if int(it.page().text) == split {
      colbreak()
    }
    let col = none //header-bg-color
    if classes.int.contains(int(it.page().text)) {
      col = category-colors.int
    } else if classes.cas.contains(int(it.page().text)) {
      col = category-colors.cas
    } else if classes.meta.contains(int(it.page().text)){
      col = category-colors.meta
    } else if classes.art.contains(int(it.page().text)){
      col = category-colors.art
    } else {
      col = black
    }
    set text(fill: col, weight: contents-weight, size: outline-size, font: outline-font)
    link((page: int(it.page().text), x: 0pt, y: 0pt), grid(
      columns: (80%, 5%, 5%),
      align: (right + horizon, right + horizon, right + horizon),
      gutter: 1em,
      it.body(),
      line(length: 100%, stroke: (thickness: 0.2em, paint: col, dash: "dotted")),
      circle(fill: col, align(center + horizon, text(fill: white, it.page())))
    ))
  }

  show outline.entry: it => {
    if int(it.page().text) >= minPage and int(it.page().text) <= maxPage {
      it
    }
  }

  outline(title: none, depth: 1)
}

#let fullOutline(
  issueDetails: none,
  classes: none,
) = {

    show: section.with(
      issueDetails: issueDetails,
      title: "In This Issue", 
      numCols: 1,
      locator: "outline",
    )

    v(2em)
    miniOutline(0, 1000, split: 49, classes: classes)
}
