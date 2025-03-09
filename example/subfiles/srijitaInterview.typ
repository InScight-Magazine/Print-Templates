#import "issueConstants.typ": *
#import "../template-files/inscight-template.typ": *

#let title = "Interview with Artificial Intelligence - 4"
#let authors = ("Suryadip Sarkar (IBAB Bengaluru)", "Tathagata Chatterjee (RKMVERI Kolkata)")
#let abstract = "Suryadip and Tathagata offer an engaging exploration of how AI is transforming biological sciences. From the early days of rule-based AI to cutting-edge deep learning applications like AlphaFold, this article traces the evolution of AI's role in biology. It highlights AI's power in solving complex problems such as protein folding, drug discovery, and genomics. With groundbreaking examples like DeepVariant and DrugGPT, readers will gain insight into AI's monumental impact on research and healthcare. Dive into the future of biology where data meets innovation!"
#let coverImage = "/subfiles/himg.jpg"

#show: section.with(
  header-global: header-global, 
  title: title, 
  authors: authors,
  abstract: abstract,
  coverImage: coverImage
)
#interview("/subfiles/sampleInterview.txt", group1: ("SS:", "AD:"), group2: "SR:")
