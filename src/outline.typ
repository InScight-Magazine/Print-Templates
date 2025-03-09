#let miniOutline(minPage, maxPage, outline-path) = {
  let outline-entries-data = yaml(outline-path)
  let outline-entries = ("key": "value")
  for var in outline-entries-data [
    #outline-entries.insert(var.at("title"), var.at("desc"))
  ]
  show outline.entry: set block(below: 1.5em)
  show outline.entry: it => {
    text(size: contents-size, weight: contents-weight)[
      #grid(
        columns: (25pt,1fr),
        align: (left,left),
        gutter: 3pt,
        text(weight: "semibold")[#link(
          (page: int(it.page().text), x: 0pt, y: 0pt),it.page()
        )],
        link(
          (page: int(it.page().text), x: 0pt, y: 0pt), 
          [
          #if outline-entries.at(it.body().text) == "" {
            text(fill: outline-headings-color, weight: "bold", size: outline-main-size)[#it.body()]
          } else {
            [#text(fill: outline-headings-color, weight: "bold", size: outline-main-size)[#it.body()] | #outline-entries.at(it.body().text)]
          }
        ]
      ),
      )
  ]}

  show outline.entry: it => {
    if it.body() != [Outline] {
      it
    }
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
  outline-path: none
) = {
  for pair in dividers.zip(imagePaths, exact: true) {
    grid(
      columns: (40%, 55%),
      align: (left + top, right + top),
      gutter: 5%,
      image(pair.at(0), fit: "cover", width: 100%),
      createOutline(startPoint, pair.at(1), outline-path)
    )
    v(20pt)
    startPoint = pair.at(1) + 1
  }
}
