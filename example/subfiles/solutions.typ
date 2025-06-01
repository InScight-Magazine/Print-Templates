#import "/template-files/inscight-template.typ": *
#import "/dataFiles/issueConstants.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "The Last Page",
  numCols: 1,
)


#grid(
  columns: (1fr, 1fr, 0.8fr),
  gutter: 0.1fr,
  align: (left, left, left),
  [
    #let answers = yaml("/dataFiles/crossword.yml").Solution
    == Crossword
    #grid(
      columns: (1fr, 1fr),
      [
        === Across
        #for (index, answer) in answers.Across [
          #enum.item(int(index))[#answer]
        ]
      ],
      [
        === Down
        #for (index, answer) in answers.Down [
          #enum.item(int(index))[#answer]
        ]
      ]
    )
  ],
  [
    == Quiz
    #let answers = yaml("/dataFiles/quiz.yml").answers
    #let options = yaml("/dataFiles/quiz.yml").options
    #for (index, answer) in answers.enumerate() [
      + #options.at(index).at(answer - 1)
    ]
  ],
  [
    == Linked List
    #let answers = yaml( "/dataFiles/linkedList.yaml").answers
    #for answer in answers [
      + #answer
    ]
  ]
)

// = Buy Us A Coffee
#v(1fr)
#align(center, 
block(width: 100%,
image("/images/ad.jpeg", width: 40%) + v(30pt) + 
rect(inset: 1em, align(left, text(size: 1.3em, [We thank _Karmakar Enterprise_ for sponsoring part of this issue. Interested in featuring your brand, event, or initiative in our magazine? Reach out to us at #email. If you are feeling generous and *wish to sponsor some printed copies* of our magazine for greater distribution, you are requested to use this #link(donationForm)[#underline[form]]. Feel free to get in touch with us at #email if you need any clarification.]))) + v(100pt)
))
