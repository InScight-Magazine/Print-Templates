#import "constants.typ": *

#let title-author(title, authors) = {
  place(
    top,
    scope: "parent",
    float: true,
    if authors != none {
    block[
      #show heading: set par(leading: 0.2em)
      #heading(level: 1, outlined: false, [#title])
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
  sideImage: none,
  sideImageFraction: 0.5,
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
      width: 100%,
      inset: margin-2,
      stroke: 0pt,
    )[
    #show heading.where(level: 1): it => [
      #set par(justify: false, leading: title-line-spacing)
      #set text(fill: title-color,size: title-size, weight: "regular", font: heading-font)
      #v(-30pt)
      #block(smallcaps(it.body))
    ]
    #heading(level: 1, outlined: true, [#title])
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      // weight: "medium",
      font: heading-font,
    )[
      #smallcaps(authors.join(linebreak()))
    ]
    ]
    #v(coverItemGap)
    #text(
        fill: title-color,
        size: abstract-size,
        // weight: "medium",
    )[
    #if sideImage != none {
      grid(
        columns: ((2 - sideImageFraction) * 1fr, sideImageFraction * 1fr),
        gutter: 2em,
        par(justify: true, first-line-indent: 0pt)[
        #abstract
        ],
        image(sideImage)
      )
    } else {
        par(justify: true, first-line-indent: 0pt)[
          #abstract
        ]
    }
  ]
]
]
}

#let researchSummary(
  file: none, 
  heights: (0,),
  title: none,
) = {
  let data = yaml(file).flatten()
  let count = 0
  let content = for item in data {
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
  [
    #heading(level:1, outlined: true, "Insight Digest")
    == Summarising The Frontiers In Research
    #v(20pt)
    #content
  ]
}

#let v-image(
  path: none, 
  caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  position: top,
  ) = {
  place(
    position,
    scope: "column",
    float: true,
    rect(fill: image-bg-color, inset: image-caption-gap)[
      #figure(
      image(path, width: 100%),
      caption: figure.caption(position: bottom, [#caption])
    )
    ]
  )
}

#let h-image(
  path: none, 
  caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  position: top,
  width: 50%,
) ={
  counter(figure).step()
  place(
    position,
    scope: "parent",
    float: true,
    rect(fill: image-bg-color, inset: image-caption-gap)[
      #grid(
      columns: (width, 100% - width - image-caption-gap),
      column-gutter: image-caption-gap,
      align: (left, horizon+right),
      image(path, width: 100%),
      align(image-caption-align)[#text(weight: caption-weight)[#figure-suppl #context {counter(figure).display()}: #caption]]
    )
    ]
  )
}

#let info(info) = {
  rect(width: 100%, fill: image-bg-color, inset: 1em, radius: 10pt)[
    #text(weight: "medium", size: main-size)[#info]
  ]
}

#let references(refsFile) = {
  [== References]
  let refsList = yaml(refsFile)
  for ref in refsList {
    [+ #ref]
  }
}

#let sign(signature) = {
  align(right)[#text(weight: "bold")[#signature]]
}
