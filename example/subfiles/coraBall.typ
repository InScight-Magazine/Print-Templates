#import "/template-files/inscight-template.typ": *

#let title = "The Cora Ball - Protecting Millions of Ocean Acres by The Second"
#let authors = ("Sharanya Chatterjee",)
#let affiliations = ("Second-year BS-MS student, IISER Kolkata",)
#let abstract = "Washing your blue shirt might seem harmless, but it can release microfibres that harm ocean life. Microfibre pollution—from textiles, hair, and pet fur—poses a growing threat to marine ecosystems. The Cora Ball, inspired by coral reefs, uses hydrodynamics to trap these fibres during laundry, reducing pollution by up to 31%. Praised by marine biologists and environmentalists, Sharanya Chatterjee takes you through the journey through her article showing a simple yet effective household solution to this global issue."
#let coverImage = "coraballcoverSmall.jpeg"
#let authorInfo = "*Sharanya Chatterjee* is a second year student of IISER Kolkata and an aspiring researcher who is passionate in the field of neuroscience, developmental biology and its manifestations. She believes in responsible research facets. Habitually reads 'maybe nots' as 'maybes'."
#let authorImage = "sharanyaFace.jpg"
#let refsFile = "/dataFiles/coraRefs.yml"
#let category = "Environmental Science"
#let reviewedBy = ("Budhaditya B", "Ishita B")
#let received = (day: 1, month: 2, year: 2025)

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: title, 
  authors: authors,
  authorAffiliations: affiliations,
  abstract: abstract,
  coverImage: "/covers/" + coverImage,
  sideImageFraction: 30%,
  authorInfo: authorInfo,
  authorImage: "/authFaces/" + authorImage,
  authorImageWidth: (90%,),
  refsFile: refsFile,
  category: category,
  reviewedBy: reviewedBy,
  received: received,
)

// begin. This is necessary for typst-to-html conversion, do not remove this.

== The Problem of Microfibers

#dcap("The news flashes across the television screen one fine morning: The proportion of aquatic life affected due to microfiber pollution is currently at 100 million; the number rises everyday! You pause to look for a second with the laundry in your hand, maybe turn the volume up. As you load the clothes in the washing machine, turn the knobs, you shake your head at the state of the times, even telling your toddler that climate change should be fought against. However, do you pause as you chuck that blue shirt into the machine and wonder what the enemy looks like? Well you don’t have to look that far. The blue shirt and millions like it, or in other words, any kind of textile and fibre are one of the primary reasons for *microfiber pollution*.")

#v-image(path: "/images/corraBallCoral.jpg", caption: "Coral Structures in the ocean. Miller's team found inspiration in nature, specifically the structure of coral, to design Cora Ball, which captures microfibers while allowing water to flow through. Coral's unique anatomy guided their design. [Photo by Francesco Ungaro]", position : bottom, width: 90%)

Synthetic textiles, which are made up of polyester, nylon, acrylic and other fibres, almost singly contribute to *engineered micro-plastics* in the ocean, accounting for 35 percent of the total volume. These microfibers are released from fabric, which can be as small as three microns, a thirteenth the width of a single strand of your hair, are too small for water treatment plants to remove.These invisible minions make their way into the ocean at large scale, allow organic pollutants like DDT and PBTs to attach, and *accumulate in the bodies* of the aquatic life like fish, and its consumers like birds and humans, becoming more and more toxic with increasing concentrations. According to a researcher at the University of Plymouth, up to 700,000 micro-fibres can shed from a 6 kg household load of textiles. And thus every time you chuck that skirt in for a wash, you plot for death of aquatic life across an acre of ocean.

#v-image(path: "/images/coraballyellow1.png", caption: "Cora Ball prevents fiber shedding from clothes, extending their lifespan and reducing microplastic pollution in our waterways. The Cora Ball’s hydrodynamics are inspired from the motion of Coral Reefs to trap food particles from the ocean water", position:top, width: 90%)

#v-image(path: "/images/rachel-miller.jpeg", caption: " *Rachel Miller* — A visionary environmentalist driven by a passion for ocean conservation. She has a bachelor of arts in anthropology (underwater archaeology) from Brown University 1993 and is a USCG Captain with an endorsement for auxiliary sail.", position:bottom, width: 90%)

== Rachel Miller and The Cora Ball
So what is the way out? Should we go back to the Stone-Age and live off bark skin and leaves and discard textiles totally? Well that might be a nice way to spend a summer afternoon but definitely isn’t practical enough for today’s life. However, a certain *Rachel Miller* wasn’t ready to sit with her hands on her lap. A marine archaeologist and a windsurfing instructor went to help clean up an island off the coast of Maine in the north-east of the US in 2009. There had been a heavy storm, and she found the beach covered in debris, most of which was washed-up fishing gear. And that made the film-roll click into place and Rachel made up her mind to make a difference – prevent plastics from ever reaching the ocean. And that brings us to Miller’s big reveal – the *Cora ball*. While it looks something you will buy to your kid from a toy shop, it does more than it shows. Cora Ball’s surface is made up of coral-like stalks which trap microfibers while water flows through it. Coral reefs and sea anemones have tentacles with surface adhesion properties on the surface, mechanical motion of which helps to filter and trap food particles from ocean water. Inspired from the same, the Cora Ball’s stalks deploy turbulence and speed fluctuation hydrodynamics which makes the circulating water *filter out the microfibers*.

The Cora Ball is easy to use as well. You have to put it into the washing machine along with the laundry and as your clothes get washed the Cora Ball *traps the microfiber* breaking off from the textiles as well as hair stuck to the clothes from the circulating water and stores it in its complex branching morphology. And as you open the lid, you take the Cora Ball out with the pollutants including textile fibre and shed fur and hair stuck to it .

#v-image(path: "/images/teamphoto.png", caption: "The Cora Ball team, from the left: Brooke Winslow, James R. Lyne and Rachel Miller. Rachael, James and technical designer Brooke Winslow joined together to create Cora Ball and launched on Kickstarter in 2017", position: top)

== Impact
The Cora Ball can be easily cleaned by parting the stalks and removing the fibre mass and discarding it into the trash. The Cora Ball also doesn’t have to be cleaned every day. The fibres need to be removed only when it becomes a sizeable mass. With the Cora Ball you ensure that microfibers do not get carried to water bodies and prevent harm to the aquatic life and the ecosystem as a whole. Later the Cora Ball is to be cleaned and becomes ready for future use again. Miller claims that even if *just 10% of US households* used the Cora Ball it would prevent an equivalent of 30 million water bottles from washing into public water bodies every year. It reduces microfiber pollution by 31% as the numbers suggest. Although it is not yet available in every country including India but Miller and her team aspire to soon turn over this fact and make Cora Ball available to combat micro-fibre pollution globally.

#colbreak()
Be it London’s Imperial College or Miller’s own Rozalia Project, people miles apart work in unison to reduce microfibers from entering the sea. This blue ball which works wonders shows how ingeniously one can make a small difference every day, through the simplest of mechanics. What started as a one-room project is in the BBC news today, with a potential of saving millions of lives. And with this words of Fullerene come to mind, “The only way to predict your future is to design it.” Happy wondering!

