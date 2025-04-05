#import "constants.typ": *

#let title-author(
  title: none, 
  authors: none,
  intro: none,
) = {
  place(
    top,
    scope: "parent",
    float: true,
    block[
      = #title
      #if authors != none [
        == #authors.join(", ")
      ]
      #if intro != none [
        == #intro
      ]
    ]
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
      font: heading-font,
    )[
      #smallcaps(authors.join(linebreak()))
    ]
    ]
    #v(coverItemGap)
    #text(
        fill: title-color,
        size: abstract-size,
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

#let digestCover(
  title: none, 
  abstract: none,
  coverImage: none,
  sideImage: none,
  sideImageFraction: 0.5,
  data: (),
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
    #heading(level: 1, [#title])
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      font: heading-font,
    )[#abstract]
    ]
    #v(coverItemGap)
    #par(leading: line-spacing, first-line-indent: 0pt)[
    #for (t,a) in data [
      #text(font: heading-font, size: abstract-size, fill: author-color, weight: "bold", a)
      #linebreak()
      #text(size: abstract-size, fill: title-color, t)
      #linebreak()
      #linebreak()
    ]
    ]
  ]
]
}

#let insightDigest(
  file: none, 
  heights: (0,),
  title: none,
  abstract: none,
  intro: none,
  coverImage: none,
) = {
  let data = yaml(file).flatten()
  let count = 0
  let coverData = ()
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
    coverData.push((item.at("Title"), item.at("Author")))
  }
  digestCover(
    title: title, 
    abstract: abstract,
    coverImage: coverImage,
    data: coverData,
    sideImage: none,
    sideImageFraction: 0.5,
  )
  [
    #heading(level:1, outlined: true, "Insight Digest")
    == #intro
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
