//////////////////////////////////////////////////////////////////////////////
// EXAMPLE ARTICLE FOR INSCIGHT
// I HAVE TRIED MY BEST TO INCLUDE AS MANY EXAMPLES OF TEMPLATING AS POSSIBLE
// TO MAKE THE EXAMPLE AS COMPREHENSIVE AS I CAN.
// IF YOU FIND ANYTHING UNCLEAR OR HAVE THOUGHTS ON MAKING THIS MORE
// COMPLETE, LET ME KNOW.
//////////////////////////////////////////////////////////////////////////////

#import "/template-files/inscight-template.typ": * // this simply imports the layouts and helpers; this never changes

#show:foreword.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  // A title is not needed for the editor's word section, 
  // it's automatically set internally. In fact, IT IS
  // NECESSARY FOR THE TEMPLATE THAT YOU NOT PASS ANY TITLE,
  // in order to disntinguish this from the foreword section,
  // that uses the same function.
  images: ("../covers/example.jpg",),
  // Array of image paths that will be dislayed alongside the writeup
  captions: ([Regulatory T cells are a unique subset of cells that play a crucial role in suppressing harmful autoreactive T cells in the body. #pageLink("interview", [Read the rest in this article.])],[#pageLink("article", [Sury  offers]), a panoramic journey through Diophantine equations, weaving together history, puzzles, deep theorems, and modern breakthroughs.]),
  // array of cations for the above images
  widths: (5em,),
  // array of widths for the above images
  // if left empty, images will take up entirety of right column
  author: [Puppala Ainesh Kumar],
  affiliation: [Editor at _InScight_, IISER Kolkata],
  // full name and affiliation of editor who wrote this
)

The initiative taken by our young minds to publish the Science Magazine _InScight_ to inculcate interests among the people in academic community to have better understanding in different interesting topics with the help of people of varied interests in science disciplines gives me immense pleasure to see that it has completed one year of its successful journey starting in January 2025. Now, in January 2026 issue, _InScight_ has brought to you the discussion of science in different disciplines including Mathematics which, in my opinion, is not a science rather a tool for developing science. This issue includes discussion on the topic of 2025 Nobel Prize in Medicine for discoveries on peripheral immune tolerance, opening a new field of research for treatments of auto-immune diseases. A discussion on Diophantine Equations, connecting Recreational Mathematics to Number Theory, will give ample scope of thinking to the mathematics lovers. You will also get discussion on prime numbers, showing how irregularities in practice follow statistical regularity. 

If you are truly motivated towards something, no obstacles can stop you reaching the destination, as can be seen through an inspiring article on how Nikolai Koshliakov developed Generalized Zeta Function from a Soviet Labour Camp. The discussion on how Niels Bohr’s work on Quantum Revolution was inspired from Bohr-Van Leeuwen theorem which raises a fundamental paradox, is an article worth reading. This issue also gives some very interesting mathematics quiz along with their correct answers. Along with some more interesting topics, one will get a wonderful discussion, through a comic, on how Dr. Subhash Mukhopadhyay was deprived of his recognition for his discovery on IVF technique, leading to his untimely demise.

The discussions are not only by the members of the IISER Kolkata community but also by the students and the faculty members of different premier institutions, showing the gain in popularity of _InScight_ in just one year period. It is mostly observed that the people at large do not think out of the traditional way because of lack of time due to different obligations, or because of lack of interest. However, there is a necessity of out-of-the-box thinking in order to promote science towards its proper utilization in human interest. You will all agree with me that any science without mathematics works like a fish out of water, and hence understanding and development of mathematics for solving different real-life problems is a must. 

Through this platform we invite students, researchers, educators and all interested citizens to get involved in different scientific discussions, and _InScight_, I am confident, will serve the purpose of bringing different domains of science under the same umbrella to handle any issue of this universe by providing a platform for critical discussion and analyses of different problems. I wish _InScight_ to keep its upward journey through the radder of success with time, as it has been doing for last one year.
