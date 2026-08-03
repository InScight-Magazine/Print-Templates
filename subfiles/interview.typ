//////////////////////////////////////////////////////////////////////////////
// EXAMPLE INTHEVIEW FOR INSCIGHT
// I HAVE TRIED MY BEST TO INCLUDE AS MANY EXAMPLES OF TEMPLATING AS POSSIBLE
// TO MAKE THE EXAMPLE AS COMPREHENSIVE AS I CAN.
// IF YOU FIND ANYTHING UNCLEAR OR HAVE THOUGHTS ON MAKING THIS MORE
// COMPLETE, LET ME KNOW.
//////////////////////////////////////////////////////////////////////////////

#import "/template-files/inscight-template.typ": * // this simply imports the layouts and helpers; this never changes

#let group1 = ("BB:", "AS:")
#let group2 = ("HE:", "LL:")
#let title = "An Example *Interview*: Monster meets monster" 
#let interviewees = ("Hobo Eager", "Lulu Lampard")
#let interviewers = ("Big Brother", "African Swordsman")
#let interviewerAffiliations = ("Institute of Xerxes", "Apocalyptic Forest")
#let abstract = "This interview is _extremely_ interesting. Be sure to read it \"carefully\"."
#let received = (month: 12, day: 7, year: 2025)
#let intervieweeInfo =  ("*Interviewee 1* description. Might be important to use formatting here, for example when stating the name of the author.", "*Interviewee 2* description")
#let coverImage =  "/covers/example.jpg"
#let intervieweeImage =  "/authFaces/example.jpg"

#show: interview.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  group1: group1,
  group2: group2,
  title: title,
  // title must be a string. Can contain formatting (bold, italic) or math (enclosed within ticks ``), 
  // but we aim to keep the title as simple as possible
  interviewees: interviewees,
  // interviewees is string or array of strings (in case of multiple interviewees).
  // Can contain formatting (bold, italic) or math (enclosed within ticks ``), 
  // but we aim to keep the title as simple as possible
  // single interviewee example: #let interviewees = ("Man 1",), or #let interviewees = "Man 1"
  interviewers: interviewers,
  // identical structure as interviewees
  interviewerAffiliations: interviewerAffiliations,
  // affiliations has properties exactly same as interviewees
  abstract: abstract,
  // String. Abstract/excerpt/pitch for the article. Formatting is possible and encouraged.
  received: received,
  intervieweeInfo:  intervieweeInfo,
  // intervieweeInfo is meant for interviewee bio and stuff. Has same properties as interviewees.
  // string for single author, array of strings for multi author
  // multi-author example: #let authorInfo = ("Desc 1", "Desc 2")
  coverImage:  coverImage,
  intervieweeImage:  intervieweeImage,
  // cover image and author image are kept in their respective folders, which must be reflected in the paths
)

BB: Welcome. I’m Big Brother, state alchemist and full-time short person with attitude. Today we’re interviewing two individuals with… complicated relationships with global peace.

AS: I’m Afrcan Swordsman. I hit things. Let’s make this quick.

BB: Our guests: Hobo Eager and Lulu Lampard. Try not to overthrow anything during the interview.

HE: No promises.

LL: I only overthrow when strategically necessary.

#img(
  path: "/images/example.jpg",
  caption: "Example image. This image only spans one column because portrait is to true. position:top forces it to the top of the page.",
  position: bottom, // location of image: can be top, bottom or auto (dependent on surrounding text).
  width: 100%, // make this > 66% to force the image to span both columns (along with portrait set to false)
  portrait: true // whether to position the caption below (true) or to the right of the image (false).
  // if width is > 66%, portrait: false also forces the image to span both columns
)
BB: First question. On a scale from one to “world-ending catastrophe,” how far are you willing to go for your ideals?

HE: Define catastrophe.

AS: That’s already a bad sign.

LL: Hypothetically, if reshaping the world eliminates suffering, then temporary catastrophe is simply an investment.

HE: Exactly.

BB: I regret inviting both of you.

AS: You two talk about changing the world. Ever try just swinging a sword at your problems?

HE: I prefer overwhelming force on a continental scale.

LL: I prefer chess.

AS: So one of you tramples everything. The other monologues until it collapses.

LL: That is a gross oversimplification.

AS: Works, though?

LL: …Occasionally.

AS: Final question. Do you ever worry you’ve become the villain?

HE: If I am, it’s for a reason.

LL: History is written by the victorious.

AS: Hm.

BB: That’s not comforting.

AS: No. But it’s honest.
#colbreak() // column break added to equalise columns

BB: Well, thank you for not destroying the studio.

HE: Yet.

LL: I calculated the odds. It wasn’t efficient.

AS: Good. Because I left my sword outside, and I’d rather not fetch it.

BB: And that concludes today’s interview before someone declares war on the furniture.
