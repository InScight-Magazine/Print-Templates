#import "template-files/inscight-template.typ": *

#show: default.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
)

#include "/subfiles/article.typ"
#include "/subfiles/interview.typ"
