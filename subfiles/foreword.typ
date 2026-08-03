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
  title: "Tradition, Science, and the Search for Truth",
  // appropriate title that captures the spirit of the writeup.
  // passing some title is mandatory, otherwise the template
  // will interpret this as the "Editor's word" section instead.
  keys: ("article", "interview"),
  // A title is not needed for the editor's word section, 
  // it's automatically set internally. In fact, IT IS
  // NECESSARY FOR THE TEMPLATE THAT YOU NOT PASS ANY TITLE,
  // in order to disntinguish this from the foreword section,
  // that uses the same function.
  imgWidths: (100%, 100%),
  fraction: 1.6fr,
  // array of widths for the above images
  // if left empty, images will take up entirety of right column
  author: [Prof. Sayam Sen Gupta],
  affiliation: [Department Of Chemical Sciences, IISER Kolkata],
  // full name and affiliation of editor who wrote this
)

First, my warmest congratulations to the team behind _InScight_. Running a scientific magazine is an experiment in itself - one that demands curiosity, persistence, and no small measure of courage. At a time when most information reaches us through fleeting WhatsApp forwards and endless social media reels, it is deeply heartening to see students choosing the slower, more thoughtful medium of print. There is a unique joy in telling the stories behind scientific discoveries, and _InScight_ gives those stories a home. For that, our entire community owes its editors and contributors sincere gratitude.

When the editorial team invited me to write this piece, I found myself wondering what message would best suit the first issue. One question that repeatedly surfaces today is whether science and tradition stand in opposition. It is a fascinating debate, and one that deserves a closer look.

Consider the story of beriberi, a disease that once devastated communities across Asia after steam mills began polishing rice, removing its nutrient-rich outer layers. Long before Christiaan Eijkman demonstrated the role of thiamine through careful experiments in the late nineteenth century, many South Asian communities had already developed the practice of parboiling paddy before milling. This simple process-still familiar to us as “seddho chaal” in Bengal and in the preparation of rice for foods such as idli and dosa - preserved much of the vitamin within the grain. The same pattern appears elsewhere. After screening more than 240,000 compounds without success, Chinese scientist Tu Youyou turned to traditional Chinese medical texts for inspiration that were used for over two millennia to treat fevers. Her team identified sweet wormwood (Artemisia annua) as a treatment for intermittent fevers and, in 1971, isolated artemisinin, its potent antimalarial compound. Artemisinin-based therapies are now the WHO's standard treatment for malaria, and Tu Youyou received the 2015 Nobel Prize in Medicine.

None of these communities for centuries knew about thiamine, or artemisinin. What they possessed was something equally valuable: knowledge accumulated through generations of observation, experimentation, and lived experience. Tradition, in this sense, is not superstition. It is a repository of successful solutions refined over centuries. But tradition has one limitation - it evolves slowly. When the Industrial Revolution transformed food production and populations grew rapidly, longstanding practices could not adapt quickly enough. This was not a failure of tradition; it was a mismatch of timescales.

That is where hypothesis-driven science becomes indispensable - not as a replacement for tradition, but as its accelerant. What once required centuries of trial and error can now be understood within a generation through careful experimentation, mechanistic insight, and peer review. The COVID-19 pandemic offered perhaps the clearest demonstration. Within weeks of the first reported cases, scientists had identified the virus and sequenced its genome. Within months, they had determined the structure of its spike protein. Within about a year, that knowledge had culminated in safe and effective vaccines developed at an unprecedented speed.

Knowledge accumulated slowly across generations and knowledge built rapidly through scientific inquiry are not competing ways of understanding the world. They are complementary. One reminds us where wisdom comes from; the other shows us how quickly that wisdom can grow when guided by evidence.

May _InScight_ continue to tell both kinds of stories.
