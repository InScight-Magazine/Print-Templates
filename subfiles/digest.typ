#import "/template-files/inscight-template.typ": *

#insightDigest(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: "/dataFiles/digest.yaml",
  heights: (52%, 49%, 54%, 55%),
  widths: (81%, 70%, 100%, 65%),
  title: "Insight Digest",
  intro: "Summarising The Frontiers In Research",
  abstract: ("Fresh highlights from the frontiers of science",),
  coverImage: "/covers/digest.png",
  coverCaption: "Researchers have discovered a new kind of “memory” in phase-change materials, where a material can remember tiny temperature disturbances even under constant conditions. This finding links the physics of metastable states to future technologies in sensitive thermal sensors and brain-inspired computing. Read the writeup by _Aniket Bajaj_ for more details.",
)
