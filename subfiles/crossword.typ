#import "/template-files/inscight-template.typ": *

#crossword(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/crossword.json",
  crosswordImage: "/images/crossword.svg",
  intro: [This issue's crossword is drawn from *chemistry*.],
  outlineDesc: " | astronomy and astrophysics",
  title: "Themed Crossword",
  crosswordWidth: 70%,
  leftColWidth: 1.1fr,
)
