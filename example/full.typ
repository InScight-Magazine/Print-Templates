#import "template-files/inscight-template.typ": *
#import "subfiles/issueConstants.typ": *

#counter(page).update(2);

#show: default.with(
  header-global: header-global,
)
#include "subfiles/editor.typ"
#fullOutline(
  dividers: (10, 20), 
  imagePaths: ("/subfiles/vimg.jpg","/subfiles/vimg.jpg",),
  outlinePath: "/subfiles/outline.yaml"
)
#include "subfiles/article-example1.typ"
#include "subfiles/article-example2.typ"
#include "subfiles/srijitaInterview.typ"
#researchSummary(
  file: "/subfiles/researchSummary.yaml", 
  heights: (34%, 45%, 44%, 48%),
  title: "InScight Digest",
)
