#import "/template-files/inscight-template.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "The Last Page",
  numCols: 1,
)

#set par(justify: false)
#grid(
  columns: (1.5fr, 1fr, 1fr),
  gutter: 2em,
  align: left,
  [
    #let answers = crossword_solution("/dataFiles/crossword.toml")
    == Crossword
    #grid(
      columns: (1fr, 1fr),
      gutter: 2em,
      [
        === Across
        #for (index, answer) in answers.a [
          #enum.item(int(index))[#upper(answer)]

        ]
      ],
      [
        === Down
        #for (index, answer) in answers.d [
          #enum.item(int(index))[#upper(answer)]

        ]
      ]
    )
  ],
  [
    == Who Am I?
    #let data = yaml("/dataFiles/whoami.yml")
    #for (index, item) in data.enumerate() [
      + #item.answer

    ]
  ],

  [
== Linked List
    #let answers = yaml( "/dataFiles/linkedList.yml").answers
    #for answer in answers [
      + #upper[#answer]
    ]
  ]
)


== Quiz
#let answers = yaml("/dataFiles/quiz.yml").answers
#let options = yaml("/dataFiles/quiz.yml").options
#for (index, answer) in answers.enumerate() [
  + #options.at(index).at(answer - 1)

]
