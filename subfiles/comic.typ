#import "/template-files/inscight-template.typ": *

#let title = "The Path To Symmetry: A Comic by Arkadeep Bandyopadhyay"
#let authors = ("Arkadeep Bandyopadhyay",)
#let authorInfo = ([Hi! I'm *Arkadeep Bandyopadhyay*, a BS-MS student at IISER Kolkata, aspiring to major in chemistry. Alongside science, I have a deep passion for design and visual art. I enjoy exploring different artistic mediums and styles as a way to learn and grow creatively. My interest in comics and graphic novels has shaped my appreciation for visual storytelling, and I enjoy blending creativity with curiosity through my work.],)

#let authorAffiliations = "IISER Kolkata"
#let authorImage = "/authFaces/arkadeep.jpeg"
#let coverImage = "/covers/comic.png"
#let comic_images = ("comic2.png", "comic3.png", "comic4.png",)

#comic(
  title: title,
  coverImage: coverImage,
  authors: authors,
  authorAffiliations: authorAffiliations,
  authorInfo: authorInfo,
  authorImage: authorImage,
  locator: "comic",
  comic_images: comic_images,
)
