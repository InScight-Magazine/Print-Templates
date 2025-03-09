#import "constants.typ": *
#import "helpers.typ": *

#let default(
  header-global: none,
  doc
) = {
set text(
  font: main-font,
  size: main-size,
  weight: "regular",
  fill: fg-color,
  hyphenate: false
)
show heading.where(level: 2): it =>[
  #set text(font: heading-font, weight: heading-weight, size: heading-2-size)
  #block(smallcaps(it.body))
]
show heading.where(level: 1): it =>[
  #set text(fill: outline-headings-color, font: heading-font, size: heading-size, weight: heading-weight)
  #block(smallcaps(it.body))
]
set par(
  justify: true,
  leading: line-spacing,
  spacing: paragraph-spacing,
  first-line-indent: 2em
)
set figure(supplement: figure-suppl, gap: image-caption-gap)
show figure.caption: c => [
  #align(image-caption-align)[#text(weight: caption-weight)[
    #c
  ]
  ]
]
set page(
  paper: page-shape,
  fill: bg-color,
  margin: (
    top: margin-1,
    bottom: margin-2,
    x: margin-2,
  ),
)
set page(
  header: rect(
    fill: header-bg-color, 
    inset: 0cm,
    outset: (x: margin-2,), 
    width: 100%, 
    height: 100%
  )[
    #set text(fill: header-bright-color)
    *#header-global*
    #h(1fr) 
    #v(header-raise)
  ]
)
set page(
  footer: context [
  #v(footer-raise)
  #line(length: 100%, stroke:footerLineHeight+fg-color)
  #text(weight: "regular", fill: fg-color)[
    #grid(
    columns: (33%, 34%, 33%),
    align: (left, center, right),
    footer-link,
    if query(<outline>).len() > 0 {
      link(<outline>)[Jump to Outline]
    },
    text(weight: "extrabold", counter(page).display("1 of 1", both: true))
    )
    ]
  ]
  )
  doc
}

#let section(
  header-global: none, 
  footer-left-1: none, 
  footer-left-2: none, 
  title: none,
  authors: (),
  abstract: none,
  coverImage: none,
  cols: 2,
  doc
) = {
set columns(gutter: column-gap)
set page(
  header: rect(
    fill: header-bg-color, 
    inset: 0cm,
    outset: (x: margin-2,), 
    width: 100%, 
    height: 100%
  )[
    #set text(fill: header-bright-color)
    *#header-global*
    #h(1fr) 
    #set text(fill: header-dark-color)
    *#title*
    #v(header-raise)
  ]
)
if coverImage != none {
  articleCover(
    title: title, 
    authors: authors,
    abstract: abstract,
    coverImage: coverImage
  )
}
title-author(
  title, 
  authors
)
columns(cols, doc)
}

#let interview(
  file: none,
  group1: (none,),
  group2: none,
  title: none,
  authors: (none,),
  abstract: "",
  coverImage: "",
) = {
  let boldflag = true
  let lines = read(file).split("\n")
  assert(lines.at(0).starts-with("abstract: "))
  let abstract = lines.at(0).split("abstract: ").at(1)
  lines.remove(0)
  let content = for line in lines {
    if line == "#colbreak()" {
      colbreak()
      continue
    }
    for name in group1 {
      if line.starts-with(name) {
        boldflag = true
      }
    }
    if line.starts-with(group2) {
      boldflag = false
    }
    if boldflag == true {
      text(weight: boldweight, fill: boldcolor)[#line]
    } else {
      text(weight: "regular", fill: fg-color)[#line]
    }
    linebreak()
  }
  [
    #show: section.with(
      title: title, 
      authors: authors,
      abstract: abstract,
      coverImage: coverImage
    )
    #content
  ]
}
