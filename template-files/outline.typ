#import "constants.typ": *
#import "helpers.typ": *
#import "layouts.typ": *

#let miniOutline(splitAt: (), spacing: 1.5em) = {

  show outline.entry: set block(below: spacing)
  show outline.entry: it => {
    if int(it.page().text) == split {
      pagebreak()
    }
    let col = none
    if it.element.supplement.text.starts-with("interview") {
      col = category-colors.int
    } else if it.element.supplement.text.starts-with("article") {
      col = category-colors.rest
    } else if it.element.supplement.text == "crossword" or it.element.supplement.text == "linkedlist" or it.element.supplement.text == "whoami" or it.element.supplement.text == "quiz" {
      col = category-colors.cas
    } else if it.element.supplement.text.starts-with("comic-") {
      col = category-colors.art
    } else {
      col = category-colors.meta
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

  outline(title: none, depth: 1)
}

#let prettyOutline(
  issueDetails: none,
  splitAt: (),
  spacing: 1.5em,
) = {

    set page(header: createTitleHeader(title: "In This Issue", issueDetails: issueDetails))

    nonCoverTitle(
      title: "In This Issue", 
      locator: "outline"
    )

    v(2em)
    show outline.entry: set block(below: spacing)
    show outline.entry: it => {
      if splitAt.contains(int(it.page().text)) {
        v(1fr)
        pagebreak()
        v(1fr)
      }
      let col = none
      if it.element.supplement.text.starts-with("interview") {
        col = category-colors.int
      } else if it.element.supplement.text.starts-with("article") {
        col = category-colors.rest
      } else if it.element.supplement.text == "crossword" or it.element.supplement.text == "linkedlist" or it.element.supplement.text == "whoami" or it.element.supplement.text == "quiz" {
        col = category-colors.cas
      } else if it.element.supplement.text.starts-with("comic-") {
        col = category-colors.art
      } else {
        col = category-colors.meta
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

    v(1fr)
    outline(title: none, depth: 1)
    v(1fr)
}
