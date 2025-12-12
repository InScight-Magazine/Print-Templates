#import "/template-files/inscight-template.typ": *
#set page(
    header: none,
    footer: none,
    margin: 0em,
    background: image("/covers/tanmoy.png", height: 100%, width: 100%, fit: "cover")
)

#set text(fill: rgb("ddd"))
#set par(leading: 0.15em, spacing: 0.25em, justify: false)
#{
set text(font: "Neuton SC")
place(
  center,
  dy: 6em,
  image("/covers/lightBanner.png", width: 70%) + 
  v(2em) +
  grid(
    columns: (auto, auto),
    align: center + horizon,
    gutter: 5em,
    text(size: 2.3em, weight: "bold", [The IISER Kolkata Science Magazine]),
    text(size: 2.3em, weight: "bold", [\##yaml("/dataFiles/issueData.yml").number | #yaml("/dataFiles/issueData.yml").time]),
  )
)
}

#link(<Sharanya-2025>)[
  #set text(font: "Neuton", size: 2.4em, weight: "bold")
  #place(
  left + horizon,
  dx: 1em,
  dy: -2em,
  box(width: 220pt,
    [THE PHYSICS OF FORGETTING #parbreak() When Information Becomes Heat #parbreak() #text(fill: yellow, [Tanmoy Pandit])]
  )
)
]

#link(<Sharanya-2025>)[
  #set text(font: "Neuton", size: 2.4em, weight: "bold")
  #place(
  right + horizon,
  dx: -1em,
  dy: 4em,
  box(width: 190pt,
    [BREAKING THE ICE #parbreak() India's First Women In Antarctica #parbreak() #text(fill: yellow, [comic by Arya Mhatre])]
  )
)
]


#link(<Sharanya-2025>)[
  #set text(font: "Neuton", size: 2.4em, weight: "bold")
  #place(
  left + horizon,
  dx: 1em,
  dy: 10em,
  box(width: 190pt,
    [THEMED CROSSWORD #parbreak() #text(fill: yellow, [Women In Science])]
  )
)
]

#pagebreak()
