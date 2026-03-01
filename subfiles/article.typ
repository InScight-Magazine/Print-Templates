//////////////////////////////////////////////////////////////////////////////
// EXAMPLE ARTICLE FOR INSCIGHT
// I HAVE TRIED MY BEST TO INCLUDE AS MANY EXAMPLES OF TEMPLATING AS POSSIBLE
// TO MAKE THE EXAMPLE AS COMPREHENSIVE AS I CAN.
// IF YOU FIND ANYTHING UNCLEAR OR HAVE THOUGHTS ON MAKING THIS MORE
// COMPLETE, LET ME KNOW.
//////////////////////////////////////////////////////////////////////////////

#import "/template-files/inscight-template.typ": * // this simply imports the layouts and helpers; this never changes

#let title = "An Example *Title*: Story of _my_ `x^2`" 
// title must be a string. Can contain formatting (bold, italic) or math (enclosed within ticks ``), 
// but we aim to keep the title as simple as possible

#let authors = "Author Name"
// author list is string or array of strings (in case of multiple authors).
// Can contain formatting (bold, italic) or math (enclosed within ticks ``), 
// but we aim to keep the title as simple as possible
// multi-author example: #let authors = ("Author 1", "Author 2")

#let affiliations = "Institute"
// affiliations has properties exactly same as authors
// multi-author example: #let affiliations = ("Insti 1", "Insti 2")

#let authorInfo = "*Author* description. Might be important to use formatting here, for example when stating the name of the author."
// authorInfo is meant for author bio and stuff. Has same properties as authors.
// string for single author, array of strings for multi author
// multi-author example: #let authorInfo = ("Desc 1", "Desc 2")

#let coverImage = "/covers/example.jpg"
#let authorImage = "/authFaces/example.jpg"
// cover image and author image are kept in their respective folders, which must be reflected in the paths

#let received = (month: 12, day: 7, year: 2025)
// article finalising date

#let abstract = "This article is _extremely_ educational. Be sure to read it \"carefully\"."
// String. Abstract/excerpt/pitch for the article. Formatting is possible and encouraged.

#let reviewedBy= "Reviewer 2"
// String or array of strings. Names of the editors/reviewers for the article.
// Same properties as authors.

#let refsFile = "/dataFiles/refs.yml"
// String. Path of data file that contains list of references for present article.

#show: article.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: title, 
  authors: authors,
  authorAffiliations: affiliations,
  abstract: abstract,
  coverImage: coverImage,
  authorImage:authorImage,
  authorInfo: authorInfo,
  received: received,
  reviewedBy: reviewedBy,
  refsFile: refsFile,
  // authorImageWidth: 100%,
  // breakAfter: (-1,),
)
// note the two optional arguments that have sensible default values and can be ignored.
// authorImageWidth: width of author image. Set to 100% by default. decrease if image becomes too big to fit
// breakAfter: array of integers. adds a column break after each of the provided integers. Used for balancing
// columns of the page. For example, if the final page contains 10 references that fill the left column and
// leave the right column empty, setting breakAfter: (5,) will add a column break between the 5th and 6th
// references and shift references 6-10 to the right column, spreading the content evenly across columns.
// By default it is set to (-1,) which means no column break is added by default. You will need to adjust this
// depending on the content.

#dcap("Initial paragraph. Everything allowed in later paragraphs (to be described) can be used here as well. The first paragraph must be passed into the dcap function to insert a drop cap at the beginning of the article.")
// the first paragraph must be passed into the dcap function to insert a drop cap at the beginning of the article.

== Section Headings

Now add *content* as _usual_, formatting as necessary.

Add images:
#img(
  path: "/images/example.jpg",
  caption: "Example image. This image only spans one column because portrait is to true. position:top forces it to the top of the page.",
  position: top, // location of image: can be top, bottom or auto (dependent on surrounding text).
  width: 100%, // make this > 66% to force the image to span both columns (along with portrait set to false)
  portrait: true // whether to position the caption below (true) or to the right of the image (false).
  // if width is > 66%, portrait: false also forces the image to span both columns
)

To add quoted statement from someone, or a line of poetry, etc, use the \#quote function: #quote("This is a quote from someone famous")
Can also be used for something _meta_, such as dedicating the article to someone at the beginning:
#quote("Dedicated to no one...")

Math is inserted by enclosing within backticks. Inline math: `x -> y`.

Block math:
```
pi = integral_0^pi tan(x) "dx"
```

Multiline block math:
```
chevron.l p chevron.r = "expec. value"
```
```
Sigma &= lim_(x -> 0) lim_(y -> infinity) lim_(z -> 1/infinity) f(x^dagger * y ^ z + z / x) \
    &+ lim_(y -> 0) lim_(z -> infinity) lim_(x -> 1/infinity) f(z^dagger * x ^ y + 1 / z)
```

*Footnotes can be added*: #footnote[This appears in the footer.]

References can be added, either as [1], [2], or as #super[1], #super[2]. References must be added in the file mentioned at the top of the file in order for them to appear in the article.

Lists can be added easily. Unordered list:
- item 1
- item 2

Ordered list:
+ item 1
+ item 2

A \#colbreak forces a column break at this point:
#colbreak()
The present text will appear on the other column of the page. Use this to distribute content evenly on the two columns.

#img(
  path: "/images/example.jpg",
  caption: "Example image. This image body spans both columns because portrait is to false and width is > 66%. position: auto means it will be positioned wherever is comfortable.",
  position: auto,
  width: 67%,
  portrait: false
)

#img(
  path: "/images/example.jpg",
  caption: "Example image. This image + caption combined spans both columns because portrait is to false but width is <= 66%. position: bottom forces it to bottom of page.",
  position: bottom,
  width: 66%,
  portrait: false
)
