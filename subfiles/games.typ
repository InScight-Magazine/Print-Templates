#import "/template-files/inscight-template.typ": *

#let gamesSummary = (
    ("Questions drawn from ideas of general science.", "Science Quiz"),
    ("The theme for this issue is Chemistry.", "Themed Crossword"),
    ("Link each term with the next, and complete the science word chain!", "Linked List"),
  )

#let coverData = for (a, t) in gamesSummary [
    #text(font: heading-font, size: abstract-size, fill: author-color, weight: "bold", a)
    #linebreak()
    #text(size: abstract-size, fill: title-color, t)
    #linebreak()
    #linebreak()
  ]

#let permalink = root-website + "issue" + yaml("/dataFiles/issueData.yml").at("number") + "/#games"
#let links = createLinks(url: permalink)
#articleCover(
  title: "Science Games", 
  coverImage: "/covers/games.jpg",
  abstract: coverData,
  coverCaption: "This issue's crossword is drawn from Chemistry.",
  attribution: [#links.at("long") #v(1em) Games designed by *Alekhya*],
  outlined: false,
  sideImageFraction: 0%,
)
