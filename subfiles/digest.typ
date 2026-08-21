#import "/template-files/inscight-template.typ": *
#import "/dataFiles/digest.typ": digest

#insightDigest(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  digest: digest,
  heights: (53%, 57%, 44%),
  widths: (100%, 97%, 100%),
  title: "Insight Digest -- Curated Science News",
  intro: "Summarising The Frontiers In Research",
  abstract: ("Fresh highlights from the frontiers of science",),
  coverImage: "/covers/digest.png",
  coverHeight: 70%,
  coverCaption: "Can our brain predict our next friend? Read more\ in the contribution by Shriparna.",
)


