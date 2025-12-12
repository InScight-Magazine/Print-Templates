#import "/template-files/inscight-template.typ": *

#crossword(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/crossword.toml",
  intro: [This issue's crossword is based on women who made pathbreaking contributions to science.],
  outlineDesc: " | Women in Science",
  title: "Themed Crossword | Women in Science",
)
