#import "/template-files/inscight-template.typ": *

#let title = "In Conversation with Dr. Chandra Shekhar Sharma"
#let file = "/dataFiles/interviewCSS.txt"
#let group1 = ("SS:",)
#let group2 = "CSS:"
#let authors = ("Swarnendu Saha",)
#let affiliations = ("IISER Kolkata",)
#let abstract = "*What does it take to become a professor at an IIT before even defending your PhD?* In this captivating conversation, Prof. Chandra Shekhar Sharma from IIT Hyderabad shares his unconventional academic journey, the evolving landscape of Indian higher education, and the pivotal role of young scientists in shaping research and policy. From navigating academia without a postdoc to leading global scientific communities, his insights challenge traditional career trajectories. He also unpacks how IIT Hyderabad’s innovative curriculum is redefining interdisciplinary education and fostering entrepreneurship."
#let coverImage = "/covers/CSSCover.jpg"
#let sideImage = "/images/CSS_cover_side.jpg"
#let received = (day: 1, month: 2, year: 2025)

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
  sideImage: sideImage,
  sideImageFraction: 40%,
)
