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
#interview(
  file: "/subfiles/sampleInterview.txt",
  group1: ("SS:", "AD:"), 
  group2: "SR:",
  title: "Interview with Artificial Intelligence - 4",
  authors: ("Suryadip Sarkar (IBAB Bengaluru)", "Tathagata Chatterjee (RKMVERI Kolkata)"),
  coverImage: "/subfiles/himg.jpg",
)
#researchSummary(
  file: "/subfiles/researchSummary.yaml", 
  heights: (34%, 45%, 44%, 48%),
  title: "InScight Digest",
)
