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
  keys: ("article", "interview"),
  // A title is not needed for the editor's word section, 
  // it's automatically set internally. In fact, IT IS
  // NECESSARY FOR THE TEMPLATE THAT YOU NOT PASS ANY TITLE,
  // in order to disntinguish this from the foreword section,
  // that uses the same function.
  imgWidths: (72%, 72%),
  // array of widths for the above images
  // if left empty, images will take up entirety of right column
  author: [Debanuj Chatterjee],
  affiliation: [Editor at _InScight_, IISER Kolkata],
  // full name and affiliation of editor who wrote this
)

Every scientific breakthrough begins with a question. Some questions seek to understand the universe at its most fundamental level, while others emerge from observing the natural world around us or reflecting on the journeys that shape scientific careers. Despite their diversity, they are united by a common thread: curiosity. It is this curiosity that continues to drive science forward, and manifests as the anthem of InScight.

We begin at the fascinating intersection of theoretical physics and mathematics: the world of conformal bootstraps. A remarkable blend of physics, geometry, and mathematical consistency forms the foundation of this field. The journey explores how quantum mechanics can be demystified by demanding the self-consistency of nature.

Gears change as we delve into the world of chemistry. Our next article explores the development of asymmetric synthesis and modern hybrid catalytic systems. The ability to selectively produce one molecular form over another has been transforming pharmaceutical science and chemical engineering over the years. This underscores how these discoveries are fundamentally reshaping modern medicine.

This year marks one hundred years since Werner Heisenberg's formulation of matrix mechanics, a milestone that forever changed our understanding of reality. Our feature on "Quantum at 100" revisits the revolutionary ideas that gave birth to quantum mechanics and reflects on how they continue to influence modern science, ranging from condensed matter physics to quantum information theory to materials science.

Science, however, is not confined to laboratories or equations alone. In a deeply personal narrative, we follow the journey of a young scientist whose dream of studying at IISER Berhampur unfolded through uncertainty, perseverance, and probability itself. It is a reminder that every scientific career is built not only on intellect, but also on resilience and the courage to embrace the unknown.

We also travel millions of years into the Earth's past to uncover the mystery behind the disappearance of giant dragonflies. Their story offers a fascinating glimpse into how changes in atmospheric composition and planetary environments have shaped the evolution of life on Earth.

Whether you are a student, researcher, or simply a curious reader, we hope this issue will spark new ideas and conversations. As we stand at a crucial crossroads of Indian science and education, we hope the growing InScight community continues to champion scientific thinking. The future of science depends not only on discoveries in laboratories but also on a society willing to ask questions. Afterall every scientific breakthrough begins with a question.
