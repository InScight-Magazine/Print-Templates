#import "/dataFiles/issueConstants.typ": *
#import "/template-files/inscight-template.typ": *

#insightDigest(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/digest.yaml", 
  heights: (45%, 57%, 48%, 48%, 29%),
  widths: (90%, 100%, 55%, 80%, 75%),
  title: "Insight Digest",
  intro: "Summarising The Frontiers In Research",
  abstract: ("Fresh highlights from the frontiers of science",),
  coverImage: "/covers/digest.jpeg",
  coverCaption: "Halder and Annagiri’s study (contributed by TM) shows how competition for limited nesting sites during relocation imposes significant fitness costs on Diacamma indicum colonies. Larger colonies gain advantage through strategic aggression and recruitment.",
)
