#import "constants.typ": *
#import "@preview/droplet:0.3.1": dropcap

#let nonCoverTitle(
  title: none, 
  intro: none,
  outlined: false,
  outlineDesc: none,
) = {
  place(
    top,
    scope: "parent",
    float: true,
    [
      = #heading(outlined: false)[#title]
      #linebreak()
      #linebreak()
      #if intro != none [
        #text(size: 1.6em, intro)
        #v(1.5em)
      ]
    ]
  )
  { 
    show heading: none
    heading(outlined: true, text(fill: outline-headings-color, weight: "bold", size: outline-main-size, title) + if outlineDesc != none [#text(fill: outline-headings-color, size: outline-desc-size)[#upper[#outlineDesc]]])
  }
}

#let articleCover(
  title: none, 
  authors: (), 
  authorAffiliations: (),
  abstract: none,
  coverImage: none,
  sideImage: none,
  sideImageFraction: 50%,
  reviewedBy: none,
  category: none,
  received: none,
  coverCaption: none,
  attribution: none,
  outlineDesc: none,
  issueId: none,
  locator: none,
  outlined: true,
) = {
  // let permalink = none
  // if authorAffiliations.len() > 0 {
  //   permalink = root-website + issueId + authors.at(0).split().at(0) + "-" + title.split().at(-1)
  // } else {
  //   permalink = root-website + issueId + title.split().at(-1)
  // }
  // let webLink = if permalink != none {
  //         link(permalink)[
  //           #align(center,
  //             text(fill: black, weight: "bold", [Web Version]) +
  //             linebreak() +
  //             box(barcode(permalink, "QRCode"))
  //           )
  //         ]
  //       }
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
    #if locator != none [
      #heading(level: 1, outlined: false, [#title])#label(locator)
    ] else [
      #heading(level: 1, outlined: false, [#title])
    ]
    #if outlined == true {
      {
        show heading: none
        heading(outlined: true, text(fill: outline-headings-color, weight: "bold", size: outline-main-size, title) + if outlineDesc != none [#text(fill: outline-headings-color, size: outline-desc-size)[#upper[#outlineDesc]]])
      }
    }
    #par(justify: false, leading: line-spacing, first-line-indent: 0pt)[
    #text(
      fill: author-color,
      size: author-size,
      font: heading-font,
      weight: "semibold",
    )[
      #for p in authors.enumerate() { p.at(1) + if authorAffiliations.len() > 0 {" (" + authorAffiliations.at(p.at(0)) + ")" } + linebreak()}
    ]
    ]
    #v(coverItemGap)
    #{
      set text(
        fill: title-color,
        size: abstract-size,
      )
    if sideImage != none {
      grid(
        columns: ((200% - 2 * sideImageFraction) * 1fr, 2 * sideImageFraction * 1fr),
        gutter: 2em,
        rows: 190pt,
        par(justify: true, first-line-indent: 0pt)[
          #eval(mode: "markup", abstract)
        ],
        image(sideImage)
      )
    } else {
        if reviewedBy != none and received != none and category != none [
          #let date = datetime(..received)
          #grid(
            columns: (1.3fr, 1fr),
            gutter: 4em,
            par(justify: true, first-line-indent: 0pt)[
              #eval(mode: "markup", abstract)
            ],
            if reviewedBy != none [
              #align(right, [
              #upper[*Reviewed by*]\
              #reviewedBy.sorted().join(", ", last: " and ")\ \
              #upper[*Submitted*]\
              #date.display("[month repr:short] [day], [year]")\ \
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
    if attribution != none {
      emph(text(fill: header-bright-color, attribution))
    }
  }
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
  align(left)[#text(weight: "bold")[#signature]]
}

#let frontCover(
  background: none
)  = {
  set page(
    paper: page-shape,
    background: image(background, height: 100%),
    header: none,
    footer: none,
  )
  linebreak()
}

#let dcap(
  content,
  dropWord: false,
) = {
  let first = if dropWord == false { content.at(0) } else { content.split(regex(" ")).at(0) }
  content = if dropWord == false { content.replace(first, "", count: 1) } else { content.replace(first + " ", "", count: 1) }
  assert(first.len() > 0)
  dropcap(height: 3, font: dcap-font, gap: 0.5em, overhang: 0.0em, depth: 0.0em, weight: "regular", emph(first), eval(content, mode: "markup"))
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

#let pageLink(
  anchor,
  text
) = {
  context[#link(("page": locate(anchor).page(), "x": 0em, "y": 0em), text)]
}

#let createLinks(
  url: none
) = {
  let webLink = link(url)[#text(baseline: -1pt, size: 1.2em, [🔗]) #h(1pt) Web version #h(5pt)]
  let webLinkLong = link(url)[#text(baseline: -2.5pt, size: 1.2em, [🔗]) #h(0.5em) Also available #underline[online], at scicomm.iiserkol.ac.in]
  return ("short": webLink, "long": webLinkLong)
}

#let createTitleHeader(
  title: "",
  issueDetails: (),
  shortLink: none,
) = {
  let headerSeparator = text(fill: header-dark-color, [])
  return rect(
      fill: header-bg-color, 
      inset: 0cm,
      outset: (x: margin-2,), 
      width: 100%, 
      height: 100%
    )[
      #text(fill: header-bright-color, weight: "bold", [INSCIGHT \##issueDetails.at("number") #h(8pt) #headerSeparator #h(8pt) #issueDetails.at("time") #h(8pt) #headerSeparator #h(8pt) #shortLink])
      #h(1fr) 
      #if title.len() > header-title-maxsize {
        text(fill: header-bright-color, weight: "bold", title.slice(0, count: header-title-maxsize) + "...")
      } else {
        text(fill: header-bright-color, weight: "bold", title)
      }
      #v(header-raise)
    ]
}

#let createPermalink(
  permalinkSuffix: none,
  issueNum: 0,
) = {
  return root-website + "issue" + issueNum + "/" + permalinkSuffix
}
