#import "/template-files/inscight-template.typ": *

#let title = "Through The Eyes Of The Founding Director: Interview with Prof. Dattagupta"
#let file = "/dataFiles/interviewSDG.txt"
#let group1 = ("SS:",)
#let group2 = "SDG:"
#let authors = ("Swarnendu Saha",)
#let affiliations = ("IISER Kolkata",)
#let abstract = "“You have to do what makes you happy, what brings you peace, and what makes you feel that you are your own person. You hold your own destiny in your hands.” says renowned condensed matter physicist Prof. Sushanta Dattagupta. As the founding Director of IISER Kolkata, he reflects on the interdisciplinary spirit of IISERs, critiques academic gatekeeping, and urges students to seek fulfillment over mere careers."
#let coverImage = "/covers/SDG.jpg"
#let coverCaption = "BS-MS graduate Swarnendu Saha with Prof. Dattagupta at the IISER Kolkata campus, after the interview."
#let sideImage = "/images/SDG.jpg"
#let received = (day: 8, month: 11, year: 2024)

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
  sideImage: sideImage,
  sideImageFraction: 30%,
)
