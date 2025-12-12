#import "/template-files/inscight-template.typ": *

#let title = "Breaking the Ice: India's First Women in Antarctica"
#let author = "Arya Mhatre"
#let authorInfo = "*Arya Mhatre* is a student at IISER Kolkata currently pursuing Earth Sciences. Beyond collecting cool rocks, she's also an illustrator and comic artist who wants to learn 2d animation."
#let authorAffiliations = "IISER Kolkata"
#let authorImage = "/authFaces/arya.jpg"
#let coverImage = "/covers/comic.svg"

#cover(
  title: title,
  coverImage: coverImage,
  locator: "comic-antarctica",
  outlined: true
)


#pagebreak()
#set page(
  background: image("/images/comic-11.pdf"),
  header: none,
  footer: none,
)
#pagebreak()
#set page(
  background: image("/images/comic-22.pdf"),
  header: none,
  footer: none,
)
#pagebreak()
#set page(
  background: image("/images/comic-33.pdf"),
  header: none,
  footer: none,
)
#pagebreak()
#set page(
  background: image("/images/comic-44.pdf"),
  header: none,
  footer: none,
)
#pagebreak()
#set page(background: none)
#show: default.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
)
#align(center,
block(width: 50%,
auth-profile(authorInfo: authorInfo, authorImage: authorImage)
+ v(1fr)
))
