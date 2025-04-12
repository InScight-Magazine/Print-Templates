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
      #authors.join(linebreak())
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
        par(justify: true, first-line-indent: 0pt)[
          #box(width: 100% - sideImageFraction, [#abstract])
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
      #block(it.body)
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
      align(image-caption-align)[#text(weight: caption-weight)[#figure-suppl #context {counter(figure).display()}: #eval(mode: "markup", caption)]]
    )
    ]
  )
}

#let info(info) = {
  rect(width: 100%, fill: image-bg-color, inset: 1em, radius: 10pt)[
    #text(weight: "medium", size: main-size)[#info]
  ]
}

#let auth-profile(
  info: "",
  imagePath: "",
  width: (100%,),
) = {
    // align(center, line(length: 80%, stroke: (thickness: 2pt, paint: header-bg-color, cap: "round")))
    // rect(width: 100%, stroke: 0.2em + author-profile-border, fill: author-profile-fill, inset: 1em, radius: 10pt,
    // figure(
    //   image(imagePath, width: width),
    //   caption: figure.caption(position: bottom, [#eval(mode: "markup", info)]),
    //   supplement: none,
    // )
    // )
  //
    align(center,
        if width.len() == 1 {
          align(center, 
            box(line(length: 25%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed"))) + h(1em) + box(line(length: 30%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "solid"))) + h(1em) + box(line(length: 25%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed")))
          )
          place(
            bottom + center,
            float: true,
            scope: "column",
            rect(width: width.sum() + image-caption-gap, stroke: 0.2em + author-profile-border, fill: author-profile-fill, inset: 1em, radius: 10pt,
              image(imagePath, width: width.at(0)) +
              v(image-caption-gap) +
              eval(mode: "markup", info)
            )
          )
        } else {
            box(line(length: 12%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed"))) + h(1em) + box(line(length: 16%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "solid"))) + h(1em) + box(line(length: 12%, stroke: (thickness: 4pt, paint: header-bg-color, cap: "round", dash: "loosely-dashed")))
          rect(width: width.sum() + image-caption-gap, stroke: 0.2em + author-profile-border, fill: author-profile-fill, inset: 1em, radius: 10pt,
            grid(
            columns: (2fr * width.at(0), 2fr * width.at(1)),
            column-gutter: image-caption-gap,
            align: left + horizon,
            image(imagePath, width: 100%),
            eval(mode: "markup", info)
          )
        )
      }
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
  dropcap(height: 4, font: "Black Jack", gap: 1em, overhang: 0.0em, depth: 0.01em, first, [#content])
}
