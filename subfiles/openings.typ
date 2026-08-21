#import "/template-files/inscight-template.typ": *

#import "/dataFiles/openings.typ": openings

#let issueDetails = yaml("/dataFiles/issueData.yml")
#let permalinkSuffix = "openings"
#let permalink = createPermalink(issueNum: issueDetails.at("number"), permalinkSuffix: permalinkSuffix)
#let links = createLinks(url: permalink)
#let title = "Academic Listings: Internships, PhDs, Post-docs"
#set page(header: createTitleHeader(title: title, issueDetails: issueDetails, shortLink: links.at("short")))

#nonCoverTitle(
  title: title, 
  locator: permalinkSuffix,
)

_Position titles are hyperlinked_

#let types = ("IN": "INTERNSHIPS", "PH": "PHD POSITIONS", "PD": "POSTDOCTORAL AND OTHER POSITIONS")
#set par(leading: 1em, spacing: 1.8em)
#for pair in types [
  #let list = ()
  #for item in openings {
    if item.at(2) == pair.at(0) {
      list.push(item)
    }
  }
  #if list.len() > 0 [
    == #pair.at(1)
    #line(length: 70%)
    #for item in list [
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
