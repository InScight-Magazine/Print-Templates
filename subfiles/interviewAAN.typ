#import "/template-files/inscight-template.typ": *

#let title = "Guiding the Next Generation of Thinkers: An Interaction With Prof. Arvind A. Natu"
#let file = "/dataFiles/interviewAAN.txt"
#let group1 = ("SS:",)
#let group2 = "AAN:"
#let authors = ("Swarnendu Saha",)
#let affiliations = ("IISER Kolkata",)
#let abstract = "From a financially humble childhood, doing odd jobs to fund his education, to becoming a scientist shaped by Germany, industry, and decades at NCL, this interview with Prof. Arvind Natu brings out the inner self of the current top most office holder of IISER Kolkata, the chairperson of the Board of Governors. Team InScight feels this interview would showcase life lessons, humour, and practical advice from someone who has seen science, institutions, and people grow over decades."
#let coverImage = "/covers/AAN.jpg"
#let coverCaption = "Where Curiosity meets Experience! Prof. Arvind Anand Natu engages students in an inspiring interactive session."
#let sideImage = "/images/AAN.jpg"
#let received = (day: 25, month: 06, year: 2025)

#interview(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  file: file,
  group1: group1,
  group2: group2,
  title: title,
  authors: authors,
  authorAffiliations: affiliations,
  abstract: abstract,
  coverImage: coverImage,
  coverCaption: coverCaption,
  coverHeight: 50%,
  sideImage: sideImage,
  sideImageFraction: 30%,
)
