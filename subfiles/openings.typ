#import "/template-files/inscight-template.typ": *

#import "/dataFiles/openings.typ": openings
#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "Academic Listings: Internships, PhDs, Post-docs", 
  permalinkSuffix: "openings",
  numCols: 1,
)
#let types = ("IN": "INTERNSHIPS", "PH": "PHD POSITIONS", "PD": "POSTDOCTORAL AND OTHER POSITIONS")
#set par(leading: 1em, spacing: 1.8em)
#for pair in types [
  == #pair.at(1)
  #line(length: 70%)
  #for item in openings [
    #if item.at(2) == pair.at(0) [
      #grid(
        columns: (2fr, 1fr),
        gutter: 2em,
        align: (right, left),
        link(item.at(0))[*#item.at(0)*],
        [#emoji.clock.alarm *Deadline*: #item.at(1)]
      )
    ]
  ]
]
