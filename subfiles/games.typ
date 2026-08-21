#import "/template-files/inscight-template.typ": *

#let gamesSummary = (
    (yaml("/dataFiles/quiz.yml").intro, "Science Quiz"),
    (toml("/dataFiles/crossword.toml").intro, "Themed Crossword"),
    (toml("/dataFiles/whoami.toml").intro, "Who Am I?"),
    (yaml("/dataFiles/linkedList.yml").intro, "Linked List"),
  )

#let permalink = root-website + "issue" + yaml("/dataFiles/issueData.yml").at("number") + "/#games"
#let links = createLinks(url: permalink)
#halfCover(
  title: "Science Games", 
  coverImage: "/covers/games.png",
  coverData: gamesSummary,
  // coverCaption: "This issue's quiz is based on popular works of science fiction.",
  outlined: false,
  coverHeight: 72%,
)
