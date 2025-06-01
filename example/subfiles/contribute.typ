#import "/template-files/inscight-template.typ": *
#import "/dataFiles/issueConstants.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "Join the Conversation",
  numCols: 1,
)

== Contribute
Contributions are welcome from students and faculty members across all academic institutions, on a rolling basis.
Submission portals for all types of content can be found on our website. More detailed guidelines are also available there, so please refer to the linked page if you're interested in contributing. For any queries, feel free to contact us at #email.

=== Science Articles
We publish engaging articles on scientific ideas, provided they are accessible to a broad audience and not limited to experts. Submit your articles #link(gform1)[*#underline[here]*].

=== Quizzes and Games
We feature science-themed games such as crosswords, quizzes, and word-link challenges. If you have content for these or ideas for new games, please email us at #email.

=== Short Summaries
To showcase cutting-edge research, we publish short summaries (350–400 words) of recently published scientific papers. The summary should broadly outline the research questions and highlight the key findings.. Submit your research stories #link(gform2)[*#underline[here]*].

=== Interview Recommendations
If you would like us to interview a particular scientific personality, or if you have an interview you’d like us to consider for publication, please reach out to us at #email.

More importantly, we would love to hear any feedback that you might have about this endeavour, so please send us your comments at #email.

== Join our team
We are currently looking to expand our team. If you are interested in what we do and are confident that you will be able to devote time to this, please reach out to us at #email. We will be happy to discuss possible roles for you depending on your skills.

#columns(
  2,
  [
    === Chief Editor
    #yaml("/dataFiles/team.yml").at("Chief")

    === Advisors
    #yaml("/dataFiles/team.yml").at("Advisors").sorted().join("\n")

    === Design & Website
    #yaml("/dataFiles/team.yml").at("Design").sorted().join("\n")

    #colbreak()
    === Editors
    #yaml("/dataFiles/team.yml").at("Editors").sorted().join("\n")

    === Social Media
    #yaml("/dataFiles/team.yml").at("Social").sorted().join("\n")

    === Science Games
    #yaml("/dataFiles/team.yml").at("Games").sorted().join("\n")
  ]
)

