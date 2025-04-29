#import "constants.typ": *
#import "@preview/droplet:0.3.1": dropcap

#let title-author(
  title: none, 
  authors: (),
  intro: none,
  outlined: false,
) = {
  place(
    top,
    scope: "parent",
    float: true,
    block[
      = #heading(outlined: outlined)[#title]
      #if authors.len() != 0 [
        == #text(fill: header-bg-color ,authors.join(", "))
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
  sideImageFraction: 50%,
  reviewedBy: none,
  category: none,
  received: none,
  coverCaption: none,
) = {
  page(
    fill: header-dark-color,
    columns: 1, 
    margin: 0cm,
    header: none,
    footer: none,
  )[
    #block[
      #image(coverImage, width: 100%, height: 50%)
      #if coverCaption != none [
        #place(bottom + right, box(width: 50%, fill: rgb(0, 0, 0, 120), inset: 0.5em, text(size: main-size - 1pt, fill: rgb(240, 240, 240), weight: "medium", coverCaption)))
      ]
    ]
    #rect(
      width: 100%,
      inset: margin-2,
      stroke: 0pt,
    )[
    #show heading.where(level: 1): it => [
      #set par(justify: false, leading: title-line-spacing)
      #set text(fill: title-color, size: heading-size, weight: heading-weight, font: heading-font)
      #v(-30pt)
      #block(it.body)
    ]
    #heading(level: 1, outlined: true, [#title])
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      font: heading-font,
      weight: "semibold",
    )[
      #authors
    ]
    ]
    #v(coverItemGap)
    #text(
        fill: title-color,
        size: abstract-size,
    )[
    #if sideImage != none {
      grid(
        columns: ((200% - 2 * sideImageFraction) * 1fr, 2 * sideImageFraction * 1fr),
        gutter: 2em,
        par(justify: true, first-line-indent: 0pt)[
          #eval(mode: "markup", abstract)
        ],
        image(sideImage)
      )
    } else {
        if reviewedBy != none and received != none and category != none [
          #grid(
            columns: (1.2fr, 1fr),
            gutter: 2em,
            par(justify: true, first-line-indent: 0pt)[
              #eval(mode: "markup", abstract)
            ],
            if reviewedBy != none [
              #align(right, [
              #upper[*Reviewed by*]\
              #reviewedBy.sorted().join(", ", last: " and ")\ \
              #upper[*Submitted*]\
              #received\ \
              #upper[*Category*] \
              #category
              ]
            )
            ]
          )
        ] else [
          #par(justify: false, abstract)
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
  coverCaption: none,
  outlineTitle: false,
  data: (),
) = {
  page(
    fill: header-dark-color,
    columns: 1, 
    margin: 0cm,
    header: none,
    footer: none,
  )[
    #context[
      #block({
        image(coverImage, width: page.width)
        place(right + bottom, block(inset: 1em, fill: rgb(0, 0, 0, 120), text(size: 1em, weight: "bold", fill: white, upper(coverCaption))))
      })
      
    ]
    #rect(
      width: 100%,
      inset: margin-2,
      stroke: 0pt,
    )[
    #show heading.where(level: 1): it => [
      #set par(justify: false, leading: title-line-spacing)
      #set text(fill: title-color,size: title-size, weight: "regular", font: heading-font)
      #v(-30pt)
      #block(it.body)
    ]
    #heading(level: 1, outlined: outlineTitle, [#title])
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      font: heading-font,
    )[#abstract]
    ]
    #v(coverItemGap)
    #par(leading: line-spacing, justify: false, first-line-indent: 0pt)[
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


#let v-image(
  path: none, 
  caption: "",
  position: top,
  scope: "column",
  width: 100%,
  ) = {
  place(
    position + center,
    scope: scope,
    float: true,
    rect(
      fill: image-bg-color,
      inset: image-caption-gap,
      width: width
    )[
      #figure(
      image(path, width: 100%),
      caption: if caption.len() > 0 {
        figure.caption(position: bottom, [#eval(mode: "markup", caption)])
      }
    )
  ]
  )
}

#let h-image(
  path: none, 
  caption: "",
  position: top,
  width: 50%,
) ={
  counter(figure.where(kind: image)).step()
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
      if caption.len() > 0 {
        align(image-caption-align)[#text(weight: caption-weight)[#figure-suppl #context {counter(figure.where(kind: image)).display()}: #eval(mode: "markup", caption)]]
      } else {
        none
      }
    )
    ]
  )
}

#let info(info) = {
  rect(width: 100%, fill: image-bg-color, inset: 1em, radius: 10pt)[
    #text(weight: "medium", size: main-size)[#info]
  ]
}

#let endLine() = {
  box(line(length: 25%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed"))) + h(1em) + box(line(length: 30%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "solid"))) + h(1em) + box(line(length: 25%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed")))
}

#let auth-profile(
  info: "",
  imagePath: "",
) = {
    align(center,
    rect(width: 80%, stroke: 0.2em + author-profile-border, fill: author-profile-fill, inset: 1em, radius: 10pt,
      grid(
        columns: (1fr, 1fr),
        align: center + horizon,
        gutter: 2 * image-caption-gap,
        image(imagePath),
        text(size: main-size, eval(mode: "markup", info))
      )
    )
  )
}

#let references(
  refsFile: none,
  breakAfter: 0,
) = {
  [== References]
  let refsList = yaml(refsFile)
  let counter = 1
  for ref in refsList {
    [#enum.item(counter)[#ref]]
    if counter == breakAfter {
      colbreak()
    }
    counter += 1
  }
}

#let sign(signature) = {
  align(right)[#text(weight: "bold")[#signature]]
}

#let frontCover(
  background: none
)  = {
  set page(
    paper: page-shape,
    background: image(background),
    header: none,
    footer: none,
  )
  linebreak()
}

#let backCover(
  background: none
)  = {
  set page(
    paper: page-shape,
    background: image(background),
    header: none,
    footer: none,
  )
  linebreak()
}

#let dcap(
  content
) = {
  let first = content.split(regex(" ")).at(0)
  content = content.replace(first + " ", "", count: 1)
  while first.len() == 0 {
    first = content.split(regex(" ")).at(0)
    content = content.replace(first + " ", "", count: 1)
  }
  dropcap(height: 4, font: dcap-font, gap: 1em, overhang: 0.0em, depth: 0.01em, weight: "regular", emph(first), eval(content, mode: "markup"))
}

#let tables(
  headings: none,
  caption: none,
  position: bottom,
  ..content
) = {
  figure(
    placement: position,
    table(
      columns: headings.len(),
      align: horizon,
      stroke: 1pt + header-bg-color,
        table.header(
          ..headings,
        ),
        ..content
      ),
      caption: caption,
      supplement: "Table"
  )
}
