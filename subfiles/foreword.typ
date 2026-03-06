//////////////////////////////////////////////////////////////////////////////
// EXAMPLE ARTICLE FOR INSCIGHT
// I HAVE TRIED MY BEST TO INCLUDE AS MANY EXAMPLES OF TEMPLATING AS POSSIBLE
// TO MAKE THE EXAMPLE AS COMPREHENSIVE AS I CAN.
// IF YOU FIND ANYTHING UNCLEAR OR HAVE THOUGHTS ON MAKING THIS MORE
// COMPLETE, LET ME KNOW.
//////////////////////////////////////////////////////////////////////////////

#import "/template-files/inscight-template.typ": * // this simply imports the layouts and helpers; this never changes

#show: foreword.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "Reflections on a Growing Scientific Dialogue",
  // appropriate title that captures the spirit of the writeup.
  // passing some title is mandatory, otherwise the template
  // will interpret this as the "Editor's word" section instead.
  images: ("../covers/example.jpg", "../covers/example2.jpg"),
  // Array of image paths that will be dislayed alongside the writeup
  captions: ([From a Soviet labor camp, Nikolai Koshliakov developed a striking generalization of the Riemann zeta function under conditions that defy imagination. #pageLink("interview", [Read more.])],[#pageLink("article", [In this interview]), Prof. Munshi reflects on a life shaped by mathematics—from early fascination with symbols to research at Princeton and a return to ISI Kolkata as a faculty member.]),
  // array of cations for the above images
  widths: (19em, 19em),
  // array of widths for the above images.
  // if left empty, images will take up entirety of right column
  author: [Prof. Asok K. Nanda],
  affiliation: [Department of Mathemetical Sciences, IISER Kolkata],
  // full name and affiliation of faculty member who wrote this
)

The initiative taken by our young minds to publish the Science Magazine _InScight_ to inculcate interests among the people in academic community to have better understanding in different interesting topics with the help of people of varied interests in science disciplines gives me immense pleasure to see that it has completed one year of its successful journey starting in January 2025. Now, in January 2026 issue, _InScight_ has brought to you the discussion of science in different disciplines including Mathematics which, in my opinion, is not a science rather a tool for developing science. This issue includes discussion on the topic of 2025 Nobel Prize in Medicine for discoveries on peripheral immune tolerance, opening a new field of research for treatments of auto-immune diseases. A discussion on Diophantine Equations, connecting Recreational Mathematics to Number Theory, will give ample scope of thinking to the mathematics lovers. You will also get discussion on prime numbers, showing how irregularities in practice follow statistical regularity. 

If you are truly motivated towards something, no obstacles can stop you reaching the destination, as can be seen through an inspiring article on how Nikolai Koshliakov developed Generalized Zeta Function from a Soviet Labour Camp. The discussion on how Niels Bohr’s work on Quantum Revolution was inspired from Bohr-Van Leeuwen theorem which raises a fundamental paradox, is an article worth reading. This issue also gives some very interesting mathematics quiz along with their correct answers. Along with some more interesting topics, one will get a wonderful discussion, through a comic, on how Dr. Subhash Mukhopadhyay was deprived of his recognition for his discovery on IVF technique, leading to his untimely demise.

The discussions are not only by the members of the IISER Kolkata community but also by the students and the faculty members of different premier institutions, showing the gain in popularity of _InScight_ in just one year period. It is mostly observed that the people at large do not think out of the traditional way because of lack of time due to different obligations, or because of lack of interest. However, there is a necessity of out-of-the-box thinking in order to promote science towards its proper utilization in human interest. You will all agree with me that any science without mathematics works like a fish out of water, and hence understanding and development of mathematics for solving different real-life problems is a must. 

Through this platform we invite students, researchers, educators and all interested citizens to get involved in different scientific discussions, and _InScight_, I am confident, will serve the purpose of bringing different domains of science under the same umbrella to handle any issue of this universe by providing a platform for critical discussion and analyses of different problems. I wish _InScight_ to keep its upward journey through the radder of success with time, as it has been doing for last one year.
