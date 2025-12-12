#import "/template-files/inscight-template.typ": *

#let gamesSummary = (
    ("Quiz based on the earth and the moon.", "Science Quiz"),
    ("The theme for this issue is women in science.", "Themed Crossword"),
    ("Link each term with the next, and complete the science word chain!", "Linked List"),
    ("Can you guess the names of these scientists?", "Who Am I?"),
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
  coverImage: "/covers/games.png",
  abstract: coverData,
  coverCaption: "Marie Curie statue in Warsaw, Poland",
  outlined: false,
  sideImageFraction: 0%,
)
