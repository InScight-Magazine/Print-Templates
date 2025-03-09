#import "issueConstants.typ": *

#let title = "InScight Digest"

#import "main.typ": *
#import "article.typ": *

#show: articleSetup.with(
  header-global: header-global, 
  title: title, 
  cols: 1
)
#researchSummary("researchSummary.yaml", (34%, 45%, 44%, 48%))
