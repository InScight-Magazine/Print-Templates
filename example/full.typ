#import "template-files/inscight-template.typ": *
#import "subfiles/issueConstants.typ": *

#counter(page).update(2);

#show: default.with(
  header-global: header-global,
)
#include "subfiles/editor.typ"
#include "subfiles/outline.typ"
#include "subfiles/article-example1.typ"
#include "subfiles/article-example2.typ"
#include "subfiles/interview.typ"
#include "subfiles/digest.typ"
#include "subfiles/quiz.typ"
#include "subfiles/linkedlist.typ"
