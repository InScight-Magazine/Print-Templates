#import "/template-files/inscight-template.typ": *

#insightDigest(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/digest.yaml",
  heights: (44%, 26%, 51%, 40%),
  widths: (100%, 70%, 45%, 100%),
  title: "Insight Digest",
  intro: "Summarising The Frontiers In Research",
  abstract: ("Fresh highlights from the frontiers of science",),
  coverImage: "/covers/digestCover.png",
  coverCaption: "In this experiment, two laser frequency combs—one on each end of a 113 km open-air path—beam precisely timed light pulses across the atmosphere to detect gases like CO₂ and H₂O with extraordinary precision. The illustration captures this setup: high-powered lasers scanning the sky, decoding the molecular makeup of the air in real time—an important step toward satellite-grade greenhouse gas monitoring from the ground.",
)
