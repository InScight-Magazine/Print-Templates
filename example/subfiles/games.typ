#import "/template-files/inscight-template.typ": *
#import "/dataFiles/issueConstants.typ": *

#let gamesSummary = (
    ("Questions drawn from ideas of general science.", "Science Quiz"),
    ("The theme for this issue is Astronomy and Astrophysics.", "Themed Crossword"),
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
  coverImage: "/covers/games.jpeg",
  abstract: coverData,
  coverCaption: "NGC 2359 is an emission nebula located 12,000 lightyears away in Canis Major, and is considered to be 280,000 times more bright than our Sun and 16 times more massive. Credit: Gerald Rhemann/CCDGuide.com and BBC Sky at Night Magazine.",
  attribution: [#links.at("long") #v(1em) Games designed by *Alekhya*],
  outlined: false,
)
