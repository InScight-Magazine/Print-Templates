#import "/template-files/inscight-template.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "The Celebration of Science For A Better Future", 
  intro: [_Foreword by Prof. Tapas Kumar Sengupta_],
  outlineDesc: "Foreword by Prof. Tapas Kumar Sengupta",
  permalinkSuffix: "foreword",
)

#place(
  auto,
  float: true,
  scope: "parent",
  grid(
    columns: (1.2fr, 1.8fr),
    gutter: 3em,
    align(left, [Science is the celebration of unravelling the mysteries of our evolving universe. Unravelling the existence and functions of galaxies involved in formation of stars, planets and evolution of life itself on our beloved blue planet. Through observations, studies and discoveries of the true facts we practise science in our everyday life. Our scientific studies made us able to understand the importance of the ecosystem and its conservation, necessity of food production and storage, combating and preventing diseases and innovation of new, better and safer therapy, safer energy production and its sustainability, faster communication and making artificial intelligence as a new tool.

    As we cannot freeze any condition forever, contentious studies and scientific experimentations are required to understand the ever-changing ecosystem and need of our civilization and to come up with more and more innovations in order to address those changes to make our planet more habitable.]),

    figure(image("/covers/sukalyan.jpg"), caption: [Knots are hard to untie, making them robust. #pageLink(<Sukalyan-Devices>, [Sukalyan Deb's article]) explores how similar robustness emerges in properties of certain quantum systems.], supplement: "", numbering: none)
  ) +
  v(2em) +
  grid(
    columns: (1.8fr, 1.2fr),
    gutter: 2em,
    figure(image("/covers/sukalyan.jpg"), caption: [Knots are hard to untie, making them robust. #pageLink(<Sukalyan-Devices>, [Sukalyan Deb's article]) explores how similar robustness emerges in properties of certain quantum systems.], supplement: "", numbering: none),
    align(left, [For that, besides the traditional scientific studies and standard scientific research, out of the box thinking is required for seeding and cultivating young minds for innovations. Let _InScight_ be the platform for the Insight of our future to seed, cultivate and nurture the open minds and unbound thoughts of the young scientists.

  After the first release of _InScight_ in the month of January in 2025, this journey is going on with a clear motivation and with fullest energy and enthusiasm to publish the fourth issue. My sincere thanks to the InScight team for having such an endeavour.  Keep going, keep doing and thinking about science. Very best wishes to the team InScight.])
  )
)
