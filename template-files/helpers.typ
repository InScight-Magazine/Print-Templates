#import "constants.typ": *
#import "@preview/droplet:0.3.1": dropcap

#let nonCoverTitle(
  title: none, 
  intro: none,
  outlined: true,
  outlineDesc: none,
  locator: none,
) = {
  place(
    top,
    scope: "parent",
    float: true,
    [
      #v(1em)
      #if locator != none [
        = #heading(outlined: false, level:1)[#eval(title, mode: "markup")]#label(locator)
      ] else [
        = #heading(outlined: false, level:1)[#eval(title, mode: "markup")]
      ]
      #v(1em)

      #if intro != none [
        #text(size: 1.6em, intro)
        #v(1.5em)
      ]
    ]
  )
  if outlined == true and locator != "outline" {
    show heading: none
    heading(outlined: true, title)
    // + if outlineDesc != none [#linebreak()#text(font: header-font, outlineDesc)]
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
  page(
    fill: header-dark-color,
    columns: 1, 
    margin: 0cm,
    header: none,
    footer: none,
  )[
    #block[
      #image(coverImage, width: 100%, height: heroImage-height)
      #if coverCaption != none [
        #place(bottom + right, box(width: 45%, fill: rgb(0, 0, 0, 150), inset: 0.5em, text(font: main-font, size: main-size - 1pt, fill: rgb(240, 240, 240), weight: "semibold", eval(coverCaption, mode: "markup"))))
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
        heading(outlined: true, title)
        // + if outlineDesc != none [#linebreak()#text(font: header-font, outlineDesc)]
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
        font: abstract-font, 
      )
    if sideImage != none {
      grid(
        columns: ((200% - 2 * sideImageFraction) * 1fr, 2 * sideImageFraction * 1fr),
        gutter: 2em,
        par(justify: true, first-line-indent: 0pt)[
          #abstract
        ] + emph(text(fill: white, attribution))
,
        image(sideImage)
      )
    } else {
        if reviewedBy != none and received != none and category != none [
          #let date = datetime(..received)
          #grid(
            columns: (2fr * (100% - sideImageFraction), 1fr * sideImageFraction),
            gutter: 4em,
            par(justify: true, first-line-indent: 0pt)[
              #eval(mode: "markup", abstract)
            ] + emph(text(fill: white, attribution)),
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
          #box(width: 100% - sideImageFraction, par(justify: true, abstract))
        ]
    }
  }
]
]
}


#let cover(
  title: none, 
  coverImage: none,
  locator: none,
  outlined: true,
) = {
  page(
    header: none,
    footer: none,
    background: image(coverImage, width: 100%, height: 100%)
  )[
    #if outlined == true {
        show heading: none
        [#heading(outlined: true, title) #if locator != none { label(locator) } else { none }]
    }
  ]
}


#let img(
  path: none, 
  caption: none,
  position: bottom+left,
  width: 100%,
  portrait: false,
  ) = {
  set text(font: caption-font)
  if portrait == true or width <= 33.3% {
  place(
    position,
    scope: "column",
    float: true,
    rect(
      fill: image-bg-color,
      inset: image-caption-gap,
      width: 100%,
    )[
      #figure(
      image(path, width: width),
      caption: if caption != none {
        figure.caption(position: bottom, emph(eval(mode: "markup", caption)))
      }
    )
    ]
  )
  } else if width > 66.6% {
  place(
    position,
    scope: "parent",
    float: true,
    rect(
      fill: image-bg-color,
      inset: image-caption-gap,
      width: 100%,
    )[
      #figure(
      image(path, width: width),
      caption: if caption != none {
        figure.caption(position: bottom, emph(eval(mode: "markup", caption)))
      }
    )
    ]
  )
  } else if width > 33.3% {
  counter(figure.where(kind: image)).step()
  place(
    position,
    scope: "parent",
    float: true,
    rect(fill: image-bg-color, inset: image-caption-gap)[
      #grid(
      columns: (width, 2fr - 2fr * width),
      column-gutter: image-caption-gap,
      align: (left, horizon+right),
      image(path, width: 100%),
      if caption.len() > 0 {
        align(image-caption-align)[#figure-suppl #context {text(fill: header-bg-color, weight: "bold", counter(figure.where(kind: image)).display())}: #emph(eval(mode: "markup", caption))]
      } else {
        none
      }
    )
    ]
  )
  }
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
  authorInfo: "",
  authorImage: "",
) = {
    line(length:80%, stroke: 0.3em + fg-color)
    image(authorImage)
    { 
      set text(size: 1.2em, font: author-font, weight: "medium")
      set par(justify: false)
      align(left, emph(eval(authorInfo, mode: "markup")))
    }
}

#let references(
  refsFile: none,
  breakAfter: (0,),
) = {
  [== References]
  let refsList = yaml(refsFile)
  let counter = 1
  for ref in refsList {
    [#enum.item(counter)[#ref]]
    if breakAfter.contains(counter) {
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
  text,
  underl: true,
) = {
  if underl == true {
    context[#link(("page": locate(anchor).page(), "x": 0em, "y": 0em), underline(text))]
  } else {
    context[#link(("page": locate(anchor).page(), "x": 0em, "y": 0em), text)]
  }
}

#let createLinks(
  url: none
) = {
  let webLink = link(url)[#text(baseline: -1pt, size: 1.2em, [🔗]) #h(1pt) Web version #h(5pt)]
  let webLinkLong = link(url)[#text(baseline: -2.5pt, size: 1.2em, [🔗]) #h(0.5em) Also available #underline[online], at scicomm.iiserkol.ac.in]
  return ("short": webLink, "long": webLinkLong)
}

#let createTitleHeader(
  title: none,
  issueDetails: (),
  shortLink: none,
  toc: false,
) = {
  return rect(
      fill: header-bg-color, 
      inset: 0cm,
      outset: (x: margin-2,), 
      width: 100%, 
      height: 100%
    )[
      #set text(font: header-font, fill: header-bright-color, weight: "semibold")
      #if toc == false [
        #text([INSCIGHT \##issueDetails.at("number") #h(8pt) #headerSeparator #h(8pt) #issueDetails.at("time") #h(8pt) #headerSeparator #h(8pt) #shortLink])
      ] else [
        #text([INSCIGHT \##issueDetails.at("number") #h(8pt) #headerSeparator #h(8pt) #issueDetails.at("time")])
      ]
      #h(1fr) 
      #if toc == false [
        #if title.len() > header-title-maxsize {
          text(title.slice(0, count: header-title-maxsize) + "...")
        } else {
          text(eval(title, mode: "markup"))
        }
      ]
      #v(header-raise)
    ]
}

#let createPermalink(
  permalinkSuffix: none,
  issueNum: 0,
) = {
  return root-website + "issue" + issueNum + "/" + permalinkSuffix
}

#let balance(
  content,
  height: none,
  cols: 3,
) = {
  block(
    height: height,
    columns(cols,
      content
    )
  )
}

#let gen_crossword(
  json_file,
) = {
  let data = json(json_file)
  let size = data.at("size")
  let blanks = data.at("blanks")
  let locations = ()
  for (k,v) in data.at("down") {
    locations.push(v.at(0))
  }
  for (k,v) in data.at("across") {
    locations.push(v.at(0))
  }
  locations = locations.dedup().sorted()

  let square(i, j) = {
    let location = i * size + j
    if blanks.contains(location) {
      box(width: crossword-cell-size, height: crossword-cell-size, fill: header-dark-color, stroke: 0.1em + header-dark-color)
    } else {
      let counter = locations.position(x => x == location) 
      if counter == none {
        box(width: crossword-cell-size, height: crossword-cell-size, stroke: 0.1em + header-dark-color, outset: 0em)
      } else {
        counter = int(counter) + 1
        box(width: crossword-cell-size, height: crossword-cell-size, stroke: 0.1em + header-dark-color, outset: 0em, inset:0.3em, align(left, text(size:1.1em, weight: "bold", fill: header-bg-color, [#counter])))
      }
    }
  }
  let row(i) = {
    grid(
      columns: size,
      ..range(size).map(j => square(i, j))
    )
  }
  let crossword = grid(
    rows: size,
    gutter: 0em,
    ..range(size).map(row)
  )
  return crossword
}


#let crossword_solution(
  json_file,
) = {
  let data = json(json_file)
  let locations = ()
  for (k,v) in data.at("down") {
    locations.push(v.at(0))
  }
  for (k,v) in data.at("across") {
    locations.push(v.at(0))
  }
  locations = locations.dedup().sorted()
  let across = ()
  for pair in data.across {
      across.push((locations.sorted().position(x => x == pair.at(1).at(0)) + 1, pair.at(0)))
  }
  let down = ()
  for pair in data.down {
      down.push((locations.sorted().position(x => x == pair.at(1).at(0)) + 1, pair.at(0)))
  }

  return ("a": across.sorted(key:p=>p.at(0)), "d": down.sorted(key:p=>p.at(0)))
}

#let important(
  content,
  color
) = {
  rect(
    inset: (y: 0.8em, x: 0em),
    stroke: (y: 0.2em + color),
    {
      emph(text(size: 1.1em, weight: "semibold", content))
    }
  )
}

#let importantFill(
  content,
  color
) = {
  rect(
    inset: 0.8em,
    fill: yellow,
    {
      emph(text(size: 1.1em, weight: "semibold", content))
    }
  )
}
