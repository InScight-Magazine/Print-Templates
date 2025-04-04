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
set heading(outlined: false)
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
  #text(weight: "black", fill: footer-text-color)[
    #grid(
    columns: (33%, 34%, 33%),
    align: (left, center, right),
    if query(selector(heading.where(level:1)).after(here())).len() > 0 {
      link((page: counter(page).at(query(selector(heading.where(level:1)).after(here())).at(0).location()).at(0)-1, x: 0pt, y: 0pt), [SKIP TO NEXT])
    },
    upper(website-link),
    link(<outline>)[#counter(page).display("1 of 1", both: true)]
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
  intro: none,
  coverImage: none,
  sideImage: none,
  sideImageFraction: 0.3,
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
    coverImage: coverImage,
    sideImage: sideImage
  )
}
title-author(
  title: title, 
  authors: authors,
  intro: intro,
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
  sideImage: none,
  sideImageFraction: 0.5,
  header-global: none, 
) = {
  set par(
    first-line-indent: 0em,
    justify: true,
  )
  let boldflag = true
  let lines = read(file).split("\n")
  let content = for line in lines {
    if line.len() == 0 {
      continue
    }
    if line == "#colbreak()" {
      colbreak()
      continue
    }
    if line.starts-with("V-IMAGE:") {
      let dict = eval(line.trim("V-IMAGE:"))
      v-image(..dict)
      continue
    }
    if line.starts-with("H-IMAGE:") {
      let dict = eval(line.trim("H-IMAGE:"))
      h-image(..dict)
      continue
    }
    for name in group1 {
      if line.starts-with(name) {
        boldflag = true
        break
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
    linebreak()
  }
  [
    #show: section.with(
      title: title, 
      authors: authors,
      abstract: abstract,
      coverImage: coverImage,
      sideImage: sideImage,
      sideImageFraction: sideImageFraction,
      header-global: header-global, 
    )
    #content
  ]
}

#let quiz(
  file: none,
  title: none,
  intro: none,
  header-global: none, 
) = {
  let content = yaml(file)
  let questions = content.questions
  let options = content.options
  let images = content.images
  assert.eq(questions.len(), options.len())
  assert.eq(questions.len(), images.len())

  let counter = 1
  content = for (q, o, i) in questions.zip(options, images) {
    [*Q#counter\.* ] + [#eval(q, mode: "markup")]
    linebreak()
    if i.len() != 0 {
      image(i, width: 50%)
    }
    for line in o {
      [+ #eval(line, mode: "markup")]
    }
    if counter < questions.len() {
      linebreak()
    }
    counter += 1
  }
  [
    #show: section.with(
      title: title, 
      header-global: header-global, 
      intro: intro,
      cols: 1,
    )
    #content
  ]
}
