#import "constants.typ": *
#import "helpers.typ": *

#let default(
  issueDetails: (),
  frontImage: none,
  doc
) = {
set text(
  font: main-font,
  size: main-size,
  weight: "regular",
  fill: fg-color,
  hyphenate: false
)
set underline(offset: 3pt)
set par(
  justify: true,
  leading: line-spacing,
  spacing: paragraph-spacing,
  first-line-indent: 0em
)
show table.cell.where(y: 0): set text(weight: "black")
show table.cell.where(y: 0): upper
show math.equation: set text(font: math-font, size:1.1em)
set heading(outlined: false)
show heading.where(level: 2): it =>[
  #set par(justify: false, leading: heading2-spacing)
  #set text(font: subheading-font, weight: heading-weight, size: heading-2-size)
  #block(it.body)
]
show heading.where(level: 1): it =>[
  #set text(fill: outline-headings-color, font: heading-font, size: heading-size, weight: heading-weight)
  #it.body
]
set figure(supplement: figure-suppl, gap: image-caption-gap)
show figure.caption: c => [
  #align(image-caption-align)[#text(weight: caption-weight)[
    #text(fill: header-bg-color, weight: "black")[
    #c.supplement #context{counter(figure.where(kind: image)).display()}
    ]
    #c.separator#c.body
  ]
  ]
]
set page(
  // width: page-dims.at(0),
  // height: page-dims.at(1),
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
    #{
      set text(font: header-font, fill: header-bright-color, weight: "semibold")
      [INSCIGHT \##issueDetails.at("number")] + h(5pt) + headerSeparator + h(5pt) + [#issueDetails.at("time")]
    }
    #v(header-raise)
  ]
)
set page(
  footer: context [
  #let elementsAfter = query(selector(heading.where(level:1)).after(here()))
  #let elementsBefore = query(selector(heading.where(level:1)).before(here()))
  #v(footer-raise)
  #line(length: 100%, stroke:footerLineHeight+fg-color)
  #text(weight: "black", fill: footer-text-color, size: 0.8em)[
    #grid(
    columns: (33%, 34%, 33%),
    align: (left + horizon, center + horizon, right + horizon),
    if elementsAfter.len() > 0 {
      if calc.even(counter(page).get().first()) {
        link((page: counter(page).at(elementsAfter.at(0).location()).at(0), x: 0pt, y: 0pt), [SKIP TO NEXT])
      } else {
        link((page: counter(page).at(elementsBefore.at(-2, default: elementsBefore.at(-1)).location()).at(0), x: 0pt, y: 0pt), [BACK TO PREV])
      }
    },
    if calc.even(counter(page).get().first()) {
      link(<outline>)[JUMP TO TOC]
    } else {
      upper(website-link)
    },
    [#box(fill: rgb(200, 200, 200), outset: 0em, height: 0.7em, width: 10em * (1 - counter(page).get().first() / counter(page).final().at(0))) #h(-0.2em) #box(fill: header-bg-color, height: 0.7em, outset: 0em, width: 10em * counter(page).get().first() / counter(page).final().at(0)) #h(0.5em) #counter(page).display()]
    )
    ]
  ]
  )
  doc
}

#let section(
  issueDetails: none,
  footer-left-1: none, 
  footer-left-2: none, 
  title: none,
  authors: (),
  authorAffiliations: (),
  abstract: none,
  intro: none,
  coverImage: none,
  coverCaption: none,
  sideImage: none,
  sideImageFraction: 50%,
  numCols: 2,
  authorInfo: none,
  authorImage: none,
  authorImageWidth: 50%,
  refsFile: none,
  reviewedBy: none,
  category: none,
  received: none,
  authProfPosition: auto,
  breakAfter: (-1,),
  outlineDesc: none,
  permalinkSuffix: none,
  locator: none,
  type: none,
  content
) = {
  if permalinkSuffix == none {
    if authorAffiliations.len() > 0 {
      permalinkSuffix = lower(authors.at(0).split().at(0) + "-" + title.split().at(-1))
    } else {
      permalinkSuffix = lower(title.split().at(-1))
    }
  }
  let permalink = createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: permalinkSuffix)

  let links = createLinks(url: permalink)

  set columns(gutter: column-gap)
  
  set page(
    header: createTitleHeader(title: title, issueDetails: issueDetails, shortLink: links.at("short"), toc: locator == "outline")
  )

if coverImage != none {
  if reviewedBy != none {
    cover(
      title: title,
      coverImage: coverImage,
      locator: if authors.len() > 0 { authors.at(0).split().at(0) + "-" + title.split().at(-1) } else { none },
    )
  } else {
    articleCover(
      title: title,
      authors: authors,
      authorAffiliations: authorAffiliations,
      abstract: abstract,
      coverImage: coverImage,
      coverCaption: coverCaption,
      sideImage: sideImage,
      sideImageFraction: sideImageFraction,
      reviewedBy: reviewedBy,
      category: category,
      received: received,
      attribution: links.at("long"),
      outlineDesc: text(font: "Hero New", if authorAffiliations.len() > 0  { authors.join(", ") } else { outlineDesc }),
      locator: if authors.len() > 0 { authors.at(0).split().at(0) + "-" + title.split().at(-1) } else { none },
    )
  }
}
if authors.len() == 0 {
  nonCoverTitle(
    title: title, 
    intro: intro,
    outlineDesc: text(font: "Hero New", outlineDesc),
    locator: locator,
  )
}
counter(figure.where(kind: image)).update(0)
columns(numCols,
if authorInfo != none {
    v(1fr)
    auth-profile(authorInfo: authorInfo, authorImage: authorImage)
    v(1fr)
    colbreak()
} + 
content
+ if refsFile != none {
  references(refsFile: refsFile, breakAfter: breakAfter)
}
)
// if authorInfo != none or refsFile != none {
//   line(length:80%)
//   grid(
//     columns: (1fr, 2fr),
//     gutter: 2em,
//     if authorInfo != none {
//         eval(authorInfo, mode: "markup")
//         image(authorImage)
//     },
//     grid.cell(breakable: false,
//     if refsFile != none {
//       references(refsFile: refsFile, breakAfter: breakAfter)
//     }
//   )
//   )
// }
}

#let interview(
  issueDetails: (),
  file: none,
  group1: (),
  group2: none,
  title: none,
  authors: (),
  authorAffiliations: (),
  abstract: "",
  coverImage: "",
  coverCaption: none,
  sideImage: none,
  sideImageFraction: 50%,
) = {
  let afterBreak = false
  let boldflag = true
  let boldStartflag = false
  let lines = read(file).split("\n")
  let firstFlag = true
  let step = -1
  let content = for textLine in lines {
    step += 1
    let trimmedLine = textLine.trim()
    if trimmedLine.len() == 0 {
      parbreak()
      continue
    }
    if trimmedLine.trim() == "COLBREAK" {
      colbreak()
      continue
    }
    if trimmedLine.starts-with("IMAGE:") {
      let dict = eval(trimmedLine.trim("IMAGE:"))
      img(..dict)
      continue
    }
    for name in group1 {
      if trimmedLine.starts-with(name) {
        trimmedLine = name + "  " + trimmedLine.replace(name, "").trim()
        boldflag = true
        if not firstFlag {
          v(1.4em)
        }
        break
      }
    }
    if trimmedLine.starts-with(group2) {
      boldflag = false
      trimmedLine = trimmedLine.replace(group2, "").trim()
      boldStartflag = true
    }
    if firstFlag == true {
      trimmedLine = dcap(trimmedLine, dropWord: true)
    } else {
      trimmedLine = eval(mode: "markup", trimmedLine)
    }

    if boldflag == true {
      set par(leading: 0.5em, justify: false)
      text(weight: "bold", size: 1.1em, fill: category-colors.int, trimmedLine)
    } else {
      if boldStartflag == true {
        boldStartflag = false
        text(weight: "bold", group2) + [~] + trimmedLine
      } else {
      set par(
        justify: true,
      )
        trimmedLine
      }
    }
    if firstFlag == true {
      firstFlag = false
      continue
    }
    // linebreak()
  } 
  [
    #show: section.with(
      issueDetails: issueDetails,
      title: title, 
      authors: authors,
      authorAffiliations: authorAffiliations,
      abstract: abstract,
      coverImage: coverImage,
      coverCaption: coverCaption,
      sideImage: sideImage,
      sideImageFraction: sideImageFraction,
      numCols: 2,
    )
    #counter(figure.where(kind: image)).update(0)
    #content
  ]
}

#let quiz(
  issueDetails: (),
  file: none,
  title: none,
  intro: none,
) = {
  let content = yaml(file)
  let questions = content.questions
  let options = content.options
  let images = content.images
  assert.eq(questions.len(), options.len())
  assert.eq(questions.len(), images.len())

  let counter = 1
  content = for (question, options, img) in questions.zip(options, images) {
    set enum(numbering: "I. ")
    if img != none { 
      if img.split(".").at(0).ends-with("-ttb") {
        stack(
          dir: ttb,
          spacing: 2em,
          align(center, image(img, width: 100%)),
          [*Q#counter\.* ] + [#eval(question, mode: "markup")] + for line in options {
          [+ #eval(line, mode: "markup")]
          },
        )
      } else {
        grid(
          columns: (1.2fr, 1fr),
          gutter: 3em,
          [*Q#counter\.* ] + [#eval(question, mode: "markup")] + for line in options {
          [+ #eval(line, mode: "markup")]
          },
          align(center, image(img, height: 15em))
        )
      }
    } else {
      [*Q#counter\.* ] + [#eval(question, mode: "markup")] + for line in options {
        [+ #eval(line, mode: "markup")]
      }
    }
    if counter < questions.len() {
      linebreak()
    }
    counter += 1
  } + v(2em) + emph[Answers can be found at the end of the issue. For an interactive version of the quiz, check out our #link(createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: "quiz"))[*#underline[website]*]#label("quiz")]

  section(
    issueDetails: issueDetails,
    title: title,
    numCols: 1,
    permalinkSuffix: "quiz",
    type: "cas",
    content
  )
}

#let linkedlist(
  issueDetails: none,
  file: none,
  title: none,
  intro: none,
) = {
  let data = yaml(file)
  let seed = upper(data.seed)
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
        issueDetails: issueDetails,
        title: title,
        numCols: 1,
        outlineDesc: " | The word linking game",
        permalinkSuffix: "linkedlist",
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

    #emph[Solution can be found at the end of the issue. For an interactive version of this game, check out our #link(createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: "linkedlist"))[*#underline[website]*]]#label("linkedlist").
  ]
}

#let crossword(
  issueDetails: none,
  file: none,
  title: none,
  intro: none,
  outlineDesc: none,
) = {
  let data = json(file)
  let locations = ()
  for (k,v) in data.at("down") {
    locations.push(v.at(0))
  }
  for (k,v) in data.at("across") {
    locations.push(v.at(0))
  }
  locations = locations.dedup().sorted()

  let down = [
    == Down
    #linebreak()
    #for (k, v) in data.down.pairs().sorted(key: p=>p.at(1).at(0)) [
      #enum.item(locations.position(i => i == v.at(0)) + 1)[#v.at(1) (#k.len())]
    ]
  ]

  let across = [
    == Across
    #linebreak()
    #for (k, v) in data.across.pairs().sorted(key: p=>p.at(1).at(0)) [
      #enum.item(locations.position(i => i == v.at(0)) + 1)[#v.at(1) (#k.len())]
    ]
  ]
  let crossword = gen_crossword(file)
  let hints = grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align: center,
    box(align(left, across)),
    box(align(left, down)),
  )
  [
    #show: section.with(
          issueDetails: issueDetails,
          title: title,
          intro: intro,
          numCols: 1,
          outlineDesc: outlineDesc,
          permalinkSuffix: "crossword",
    )

    #align(center, crossword)

    #v(1fr)
    #hints
    #v(1fr)

    #emph[Solution can be found at the end of the issue. For an interactive version of the crossword, check out our #link(createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: "crossword"))[*#underline[website]*]]#label("crossword").

  ]
}

#let insightDigest(
  issueDetails: none,
  file: none, 
  heights: (50%,),
  widths: (100%,),
  title: none,
  abstract: none,
  intro: none,
  coverImage: none,
  coverCaption: none,
) = {
  let data = yaml(file).flatten()
  let count = 0
  let coverData = ()
  let content = ()
  for item in data {
    content.push([
      #box(height: heights.at(count), clip: true)[
      #par(leading: rs-spacing)[
      #text(size: rs-title-size, fill: rs-title-color, weight: "medium", eval(item.at("Title"), mode: "markup")) #label("digest-" + item.at("Author").split().at(0))
      #linebreak()
      #text(size: rs-size)[
        #link(item.at("Url"))[#underline[#item.at("Reference")]]
        #linebreak()
        Contributed by #text(weight: "bold")[#item.at("Author") (#item.at("Affiliation"))]
        #linebreak()
      ]
      ]
      #columns(2, eval(item.at("Summary"), mode:"markup"))
      ]

      #rect(
        align(center, image("/images/"+item.at("Image"), fit: "cover", width: widths.at(count))) +
        align(center, text(weight: "semibold", eval(item.at("Caption"), mode: "markup"))),
        stroke: 0.2em + header-bg-color,
        inset: 1em
      )
    ])
    count = count + 1
    coverData.push((item.at("Title"), item.at("Author")))
  }

  let permalink = createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: "digest")
  let links = createLinks(url: permalink)

  coverData = for (t,a) in coverData [
    #text(font: heading-font, size: abstract-size, fill: author-color, weight: "bold", a)
    #text(size: abstract-size, fill: title-color, eval(t, mode: "markup"))
    #linebreak()
    #linebreak()
  ] + emph(text(weight: "bold", links.at("long")))
  set page(
    header: createTitleHeader(title: title, shortLink: links.at("short"), issueDetails: issueDetails)
  )
  articleCover(
    title: title, 
    authors: abstract,
    coverImage: coverImage,
    abstract: coverData,
    coverCaption: coverCaption,
    sideImageFraction: 0%,
    outlineDesc: " | " + intro,
  )

  for c in content {
    c
    pagebreak()
  }
}

#let backCover(
  images: (),
  titles: (),
  captions: (),
  footerLeft: none,
  footerRight: none,
) = {
align(center, text(size: 1.6em, weight: "bold", fill: backpage-color, [You made it to the end! While we cook up the next issue, here's a random photo dump.]),)
  let capt(title, caption) = {
    return align(left, text(fill: header-bg-color, size: backCover-caption-size + 0.2em, weight: "semibold", title) + linebreak() + text(size: backCover-caption-size, weight: "semibold", fill: backpage-color, caption))
  }
  stack(
    dir: ttb,
    spacing: 3em,
    grid(
      columns: (45%, 55%),
      gutter: 1em,
      align: right + bottom,
      capt(titles.at(0), captions.at(0)),
      image(images.at(0), width: 100%),
    ),
    grid(
      columns: (55%, 45%),
      gutter: 1em,
      align: left + bottom,
      image(images.at(1), width: 100%),
      capt(titles.at(1), captions.at(1))
    ),
    grid(
      columns: (45%, 55%),
      gutter: 1em,
      align: right + bottom,
      capt(titles.at(2), captions.at(2)),
      image(images.at(2), width: 100%),
    )
  )
}

#let whoami(
  issueDetails: (),
  file: none,
  title: none,
  intro: none,
) = {
  let data = yaml(file)
  let items = ()
  for (i, item) in data.enumerate() {
    let gd = none
    if calc.rem(i, 2) == 1 {
      gd = grid(
          columns: (0.8fr, 0.5fr),
          align: left + top,
          gutter: 4em,
          [
          == #item.question

          #list(
            tight:false,
            ..item.hints
          )
        ],
         image("../images/" + item.image, height: 18%, width: 100%, fit: "cover"),
      )
    } else {
      gd = grid(
          columns: (0.5fr, 0.8fr),
          align: left + top,
          gutter: 4em,
          image("../images/" + item.image, height: 18%, width: 100%, fit: "cover"),
          [
          == #item.question

          #list(
            tight:false,
            ..item.hints
          )
          ],
      )
    }
    items.push(gd)
    if i < data.len() - 1 {
      items.push(align(center, line(length: 40%)))
    }
  }

  let content = intro + v(2em) + stack(
    dir: ttb,
    spacing: 2em,
    ..items
  )

  section(
    issueDetails: issueDetails,
    title: title,
    numCols: 1,
    permalinkSuffix: "whoami",
    type: "cas",
    content
  )
}
