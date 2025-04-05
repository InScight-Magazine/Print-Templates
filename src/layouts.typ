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
show math.equation: set text(font: math-font)
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
let outlined = true
if coverImage != none {
  outlined = false
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
  outlined: outlined,
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
      text(weight: boldweight, fill: fg-color)[#line]
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
    set enum(numbering: "I. ")
    for line in o {
      [+ #eval(line, mode: "markup")]
    }
    if counter < questions.len() {
      linebreak()
    }
    counter += 1
  }
  section(
    title: title,
    intro: intro,
    cols: 1,
    content
  )
  // [
  //   #heading(level:1, outlined: true, title)
  //   == #intro
  //   #v(20pt)
  //   #content
  // ]
}

#let linkedlist(
  file: none,
  title: none,
  intro: none,
  header-global: none, 
) = {
  let data = yaml(file)
  let seed = data.seed
  let hints = data.hints
  let answers = data.answers
  assert.eq(answers.len(), hints.len())
  let counter = 1
  let content = for (h, a) in hints.zip(answers) {
    let letterCount = 1
    let strokeDef = (thickness: 1.5pt, paint: header-bg-color)
    let boxes = for i in a {
      if counter == 1 and letterCount == 1 {
        box(square(size: 18pt, stroke: strokeDef, [#text(weight: "medium", size: 13pt, seed.last())]), inset: 0pt, outset: 0pt)
      } else if counter == hints.len() and letterCount == a.len() {
        box(square(size: 18pt, stroke: strokeDef, [#text(weight: "medium", size: 13pt, seed.at(0))]), inset: 0pt, outset: 0pt)
      } else {
        box(square(size: 18pt, stroke: strokeDef), inset: 0pt, outset: 0pt)
      }
      letterCount += 1
    }
    [
      #set par(first-line-indent: 0em)
      #enum.item(counter)[
        #h (#a.len()) 

        #linebreak() 
        #v(-2.5em)
        #boxes
        #v(1em)
      ]
    ]
    counter += 1
  }
  [
    #show: section.with(
          title: title,
          cols: 1,
    )

    Linked List is a general science-based word game. The rules are straightforward:
    + The goal is to guess eleven words that have been drawn from science.
    + The first word (the seed) will be provided to you, and hints and number of letters will be provided for the remaining words.
    + You are also informed that the first letter of any word is the last letter of the previous word. So the first letter of the second word will be the last letter of the seed word, the first letter of the third word is the last letter of the second word, and so on.
    + This property goes all the way, so that the last letter of the last (eleventh) word is also the first letter of the seed word.

    Find all the words!
    #linebreak()
    #linebreak()
    Today's seed: *#seed*

    #content

    Answers can be found at the end of the issue. For an interactive version of this as well as the other games, check out our #link("https://scicomm.iiserkol.ac.in/games/")[*#underline[website]*].
  ]
}

#let crossword(
  file: none,
  crosswordImage: none,
  crosswordWidth: 100%,
  title: none,
  intro: none,
  header-global: none, 
  leftColWidth: 1fr,
) = {
  let data = yaml(file).Hints
  let across = [
    *Across*
    #linebreak()
    #for (k, v) in data.Across [
      #enum.item(int(k))[
        #v
      ]
    ]
  ]
  let down = [
    *Down*
    #linebreak()
    #for (k, v) in data.Down [
      #enum.item(int(k))[
        #v
      ]
    ]
  ]
  let content = grid(
    columns: (leftColWidth, 2fr - leftColWidth),
    gutter: 1em,
    [#across],
    [#down]
  )
  [
    #show: section.with(
          title: title,
          intro: intro,
          cols: 1,
    )

    #align(center, [#image(crosswordImage, width: crosswordWidth)])

    #content

    Answers can be found near the end of the issue. For an interactive version, check out our #link("https://scicomm.iiserkol.ac.in/games/")[*#underline[website]*].

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
  section(
    title: title,
    intro: intro,
    cols: 1,
    content
  )
}
