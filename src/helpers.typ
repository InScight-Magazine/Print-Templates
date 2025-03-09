#let title-author(title, authors) = {
  place(
    top,
    scope: "parent",
    float: true,
    if authors != none {
    block[
      #show heading: set par(leading: 0.2em)
      = #title
      == #authors.join(", ")
    ]
  } else {
    block[
      = #title
    ]
  }
  )
}

#let articleCover(
  title: none, 
  authors: none, 
  abstract: none,
  coverImage: none,
) = {
  page(
    fill: header-dark-color,
    columns: 1, 
    margin: 0cm,
    header: none,
    footer: none,
  )[
    #context[#image(coverImage, width: page.width)]
    #rect(
      width: 100% - coverRightMargin,
      inset: margin-2,
      stroke: 0pt,
    )[
    #par(justify: false, leading: title-line-spacing)[
    #text(
      fill: title-color,
      size: title-size,
      weight: "regular",
      font: heading-font,
    )[#smallcaps(title)]\
    ]
    #v(coverItemGap)
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      weight: "medium",
      font: heading-font,
    )[
      #smallcaps(authors.join(linebreak()))
    ]
    ]
    #v(coverItemGap)
    #par(justify: true, first-line-indent: 0pt)[
    #text(
      fill: title-color,
      size: abstract-size,
      weight: "medium",
    )[
      #abstract
    ]
  ]
  ]
]
}

#let interview(
  file,
  group1: (none,),
  group2: none,
) = {
  let boldflag = true
  let firstFlag = true
  for line in csv(file,delimiter:"\t").flatten(){ 
    if line == "#colbreak()" {
      colbreak()
      continue
    }
    for name in group1 {
      if line.starts-with(name) {
        if firstFlag != true {
          linebreak()
        }
        boldflag = true
      }
    }
    if line.starts-with(group2) {
      if firstFlag != true {
        linebreak()
      }
      boldflag = false
    }
    if boldflag == true {
      text(weight: boldweight, fill: boldcolor)[#line]
    } else {
      text(weight: "regular", fill: fg-color)[#line]
    }
    linebreak()
    firstFlag = false
  }
}

#let researchSummary(
  file, 
  heights,
) = {
  let data = yaml(file).flatten()
  let count = 0
  for item in data {
    box(height: heights.at(count))[
      #par(leading: rs-spacing)[
      #text(size: rs-size, fill: rs-title-color, weight: "bold")[#item.at("Title")]
      #linebreak()
      #text(size: rs-size)[
        #item.at("Reference")
        #linebreak()
        Contributed by #text(weight: "extrabold")[#item.at("Author") (#item.at("Affiliation"))]
        #linebreak()
      ]
    ]
    #columns(2, item.at("Summary"))
    ]
    v(0.5em)
    count = count + 1
  }
}
