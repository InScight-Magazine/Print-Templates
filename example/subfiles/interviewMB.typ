#import "/template-files/inscight-template.typ": *

#let title = "In Conversation with Prof. Mustansir Barma"
#let file = "/dataFiles/interviewMB.txt"
#let group1 = ("SS:",)
#let group2 = "MB:"
#let authors = ("Swarnendu Saha",)
#let affiliations = ("IISER Kolkata",)
#let abstract = "*What sparks a lifelong passion for physics—and what does it take to lead one of India’s premier scientific institutions?* In this rich and wide-ranging conversation, Prof. Mustansir Barma opens up about his journey from a curious schoolboy writing letters to textbook authors to becoming a celebrated physicist and the founding director of TIFR Hyderabad. He reflects on the essence of randomness, the beauty of phase transitions, the art of asking questions, and the quiet power of effective leadership."
#let coverImage = "/covers/MB2Cropped.jpeg"
#let sideImage = "/images/MBFace.jpg"
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
  sideImage: sideImage,
  sideImageFraction: 40%,
)
