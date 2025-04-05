#import "/template-files/inscight-template.typ": *
#import "issueConstants.typ": *

#show: section.with(
  title: "Join the Conversation",
  cols: 1,
)

== Contribute
Contributions are welcome from students and faculty members across all academic institutions, on a rolling basis. The portals for submitting all kinds of content can be found on our website. More specific details regarding content submission can also be found #link(submit-link)[*#underline[here]*], so please take a close look at the linked page if you are interested in contributing. For any queries, reach out to us at #email.

#grid(
  columns: (0.9fr, 1.1fr),
  gutter: 2em,
  [
    === Science Articles
  We publish write-ups on interesting ideas in science, as long as the content is accessible to a broader audience and not just to the experts. Submit your articles #link(gform1)[*#underline[here]*].

    === Quizzes and Games
    We also feature science games such as crosswords, quizzes and word-link games. If you have content for these games or have new interesting games in mind, please pass them on to us via our email.
  ],

  [
    === Short Summaries
  In order to showcase the frontiers of research, we publish short summaries (350-400 words) of recently published science research articles. The summary should broadly lay out the questions being asked and the new results obtained. Submit your research stories #link(gform2)[*#underline[here]*].

    === Interview Recommendations
    If you want us to interview specific scientific personalities or if you have an interview that you want to publish, please send us an email.
  ]
)

Finally, but very importantly, we would love to hear any feedback that you might have about this endeavour, so please send us your comments at #email.

== Collaborate
We are currently looking to expand our team. If you are interested in what we do and are confident that you will be able to devote time to this, please reach out to us at #email. We will be happy to discuss possible roles for you depending on your skills.

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  [
    === Chief Editor
    Swarnendu Saha

    === Advisors
    Prof. Anindita Bhadra\ 
    Prof. Somnath Basu\ 
    Prof. Subhajit\ 
    Bandyopadhyay
  ],
  [
    === Editors
    Archita Sarkar\
    Budhaditya Banerjee\
    Suman Halder\
    Shibaraj Sahu\
    Ayan Biswas\
    Chitradeep Saha\
    Medha Roy Choudhury
  ],
  [
    === Design & Website
    Abhirup Mukherjee\ 
    Madhura Theng\ 
    Meghithdharshan R\ 
    Thushiyantheswaran
  ],
  [
    === Social Media
    Sayan Saha

    === Science Games
    Alekhya Kundu
  ]
)

#linebreak()
#grid(
  columns: (1.5fr, 0.5fr, 1fr),
  align: (left, center, right),
  [
    #let answers = yaml(crosswordpath).Solution
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
    #let answers = yaml(quizpath).answers
    #let options = ("I", "II", "III", "IV")
    #for answer in answers [
      + #options.at(answer - 1)
    ]
  ],
  [
    == Linked List
    #let answers = yaml(linkedlistpath).answers
    #for answer in answers [
      + #answer
    ]
  ]
)
