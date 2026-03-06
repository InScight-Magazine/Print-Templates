#import "template-files/inscight-template.typ": *

#show: default.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
)

#include "/subfiles/foreword.typ"
#include "/subfiles/editor.typ"
#include "/subfiles/article.typ"
#include "/subfiles/interview.typ"
