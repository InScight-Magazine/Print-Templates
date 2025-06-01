#import "/template-files/inscight-template.typ": *
// #import "/dataFiles/issueConstants.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "A Word from the Editor", 
  intro: [_To those who still marvel at stars, cells, and stories—we turn these pages with you_...],
  permalinkSuffix: "editor",
)

#place(
  top + left,
  float: true,
  scope: "parent",
  [
    #grid(
      columns: (1.2fr, 1.2fr),
      align: left + top,
      gutter: 5em,
      [#dcap("As we bring you the *third* issue of InScight, we’re excited to continue this journey of exploring science in all its depth and variety. Every issue is driven by a *shared curiosity* and the joy of learning—things we believe science is truly about.")

This edition brings together stories, reflections, and discoveries that we hope will spark your interest and imagination. Inside, you’ll find a wide range of topics: from the clever ways *temple langurs* adapt their behaviour, to the stunning natural nanostructures found on *dragonfly wings*. There's a deeply personal piece on the path from being a BS-MS student to becoming an *independent scientist*, and thoughtful interviews with researchers like Dr. Chandra Shekhar Sharma and Prof. Mustansir Barma, who generously share their *insights and journeys*. We also explore advances in understanding rare diseases, efforts to protect *marine ecosystems*, and bring you a themed crossword and word-linking game for a bit of fun.

What makes InScight special is the *spirit of collaboration* that goes into it—students, alumni, faculty, and enthusiasts all contributing in their own ways. If you’ve enjoyed reading this
    ],
      image("/covers/digest.jpeg", height: 25%, width: 100%, fit: "cover") + text(fill: header-dark-color, weight: "black", [Competition for limited nesting sites during relocation imposes significant fitness costs on Diacamma indicum colonies. See Insight Digest submission by #pageLink(<digest-Tanusree>,underline[Tanusree]).]),
    )

    #v(2em)
    #grid(
      columns: (1.2fr, 1.2fr),
      align: left + top,
      gutter: 5em,
     image("/covers/MB2Cropped.jpeg", height: 25%, width: 100%, fit: "cover") + text(fill: header-dark-color, weight: "black", [\"Question everything. How do you even know if a question is right or wrong until you define it and explore the answer?\" - Prof. Mustansir Barma in his #pageLink(<Swarnendu-Barma>, underline[interview]).]),
      [issue and appreciate the effort behind it, we would be thrilled to *have you join us*. We warmly welcome contributions in the form of articles, art, opinions, or ideas for future pieces.

Looking ahead, we dream of growing this platform—not just online, but possibly as a beautiful print edition that you could flip through with a cup of coffee in hand. If you’ve enjoyed our work and believe in what we’re building, any kind of support or encouragement — whether through kind words, *contribution of content*, or helping us reach that future - is something we’ll always be grateful for.

Thank you for reading, for your time, and for being part of this little community of science lovers. We hope you enjoy this issue as much as we enjoyed creating it. And as always, we’d love to hear what you think.

With warmth,
#sign([Suman Halder,\ Editor,\ InScight]),
],
)
]
)
