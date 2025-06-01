#import "template-files/inscight-template.typ": *
// #import "dataFiles/issueConstants.typ": *

#show: default.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
)

#include "/subfiles/front.typ"
#include "/subfiles/editor.typ"
#include "/subfiles/foreword.typ"
#include "/subfiles/outline.typ"
#include "/subfiles/sayan.typ"
#include "/subfiles/dishari.typ"
#include "/subfiles/debanuj.typ"
#include "/subfiles/interviewCSS.typ"
#include "/subfiles/tisha.typ"
#include "/subfiles/coraBall.typ"
#include "/subfiles/interviewMB.typ"
#include "/subfiles/digest.typ"
#include "/subfiles/games.typ"
#include "/subfiles/quiz.typ"
#include "/subfiles/crossword.typ"
#include "/subfiles/linkedlist.typ"
#include "/subfiles/contribute.typ"
#include "/subfiles/solutions.typ"
#include "/subfiles/back.typ"
