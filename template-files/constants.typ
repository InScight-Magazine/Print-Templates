// font defaults
#let main-font = "Merriweather"
#let math-font = "New Computer Modern Math"
#let heading-font = "Neuton"
#let outline-font = "Barlow"
#let author-font = "Lato"
#let caption-font = "Bitter"
#let subheading-font = "Barlow"
#let abstract-font = "Bitter"
#let header-font = "Lora"
#let heading-weight = 600
#let dcap-font = "Merriweather"
#let main-size = 9pt
#let heading-size = 25pt
#let heading-2-size = 1.4em
#let author-size = 18pt
#let abstract-size = 1.2em
#let line-spacing = 0.5em
#let paragraph-spacing = 1.2em
#let heading2-spacing = 0.4em
#let heroImage-height = 60%
#let backCover-caption-size = 1.2em

// page layout
#let margin-1 = 1.68cm
#let margin-2 = 1.3cm
#let column-gap = 12pt
#let page-shape = "a4"
// #let page-dims = (9in, 11in)
// #let page-dims = (8.27in, 11.69in)

// article cover page
#let coverRightMargin = 2 * margin-2
#let coverItemGap = 0.5 * margin-2
#let title-line-spacing = 0pt
#let title-weight = "medium"
#let author-color = rgb("ffd58b")

// colours
#let fg-color = rgb("282828")
#let bg-color = rgb("fcfcfc")
#let title-color = rgb("e0e0e0")
#let author-profile-fill = rgb("FFDBBB88")
#let author-profile-border = rgb("FFDBBB")
#let backpage-color = rgb("353535")

// header and footer
#let header-bg-color = rgb("bd2033")
#let header-dark-color = fg-color
#let header-bright-color = rgb("ffffff")
#let header-raise = 10pt
#let footer-weight = "bold"
#let footer-raise = -5pt
#let footerLineHeight = 1pt
#let footer-text-color = rgb("4a4a4a") //header-bg-color
#let header-title-maxsize = 61

// figures
#let figure-suppl = text(weight: "bold", fill: header-bg-color, [FIG])
#let caption-weight = "medium"
#let image-caption-gap = 1em
#let image-caption-align = center
#let image-bg-color = rgb("f8f8f8")

// table of contents
#let outline-headings-color = rgb("454545")
#let contents-weight = "semibold"
#let outline-size = 1.5em
#let category-colors = ("art": rgb("70b23f"), "int": rgb("36454f"), "meta": rgb("DAA520"), "cas": rgb("913831"))

// interviews
#let boldweight = "bold"
#let boldcolor = outline-headings-color
#let separatorStroke = line(length: 60%, stroke: 0.3em + header-bg-color) + v(0.5em)

// research summary
#let rs-title-size = 1.6em
#let rs-size = 1.2em
#let rs-title-color = header-bg-color
#let rs-spacing = 1.1em

// links
#let root-website = "https://scicomm.iiserkol.ac.in/"
#let website-link = link(root-website)[scicomm.iiserkol.ac.in] 
#let submit-link = "https://scicomm.iiserkol.ac.in/submit/"
#let email = link("mailto:scicomm@iiserkol.ac.in")[_scicomm\@iiserkol.ac.in_]
#let gform1 = "https://forms.gle/upAn7ECYkWze9h2U7"
#let gform2 = "https://forms.gle/C7z6HmnAznQGscoA9"
#let donationForm = "https://docs.google.com/forms/d/e/1FAIpQLSc1XWwxSF3UDJZVXpvmdlTDRUjmi0Gv4l5vk24VnTs_aUhsVQ/viewform?usp=preview"

// misc
#let crossword-cell-size = 2.5em
