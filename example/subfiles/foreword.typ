#import "/template-files/inscight-template.typ": *
// #import "/dataFiles/issueConstants.typ": *

#show: section.with(
  issueDetails: yaml("/dataFiles/issueData.yml"),
  title: "Reclaiming the Joy of Scientific Discovery", 
  intro: [_Foreword by Prof. Balaram Mukhopadhyay_],
  outlineDesc: " | Foreword by Prof. Balaram Mukhopadhyay",
  permalinkSuffix: "foreword",
)

#place(
  top + left,
  scope: "parent",
  float: true,
  columns(2,
  [The pleasure of science resides in the joy of attaining certain knowledge that unfolds the mystery of life. One must soak in to the intricate beauty of nature and become inquisitive enough to find a topic for cutting-edge research. To do something for the society with your acumen and expertise, you need to generate the right spirit in your mind. Dive in the nature around you, you’ll be intrigued by the happenings there and slowly you’ll be able to connect things of cross-talking between the nature and our daily life. A myriad of unknowns and half-knowns will tickle your brain and insist you to sink deep with the zeal to unravel the mystery behind. The pleasant feeling of your mind amidst the greenery around, provokes your thoughts towards plant metabolism, growth factors etc. and naturally it makes you enthusiastic to learn. At that juncture, you deal with curriculum books and complex theories with ease as they cater your curiosity. I get excited when I see your posters with colourful flowers and birds or the pictorial listing of snakes in our campus. I remember the initiative of marking campus trees with their local and scientific names. The acquaintance with campus flora and fauna surely triggers newer ideas and path of exploration. 200 acres of land will definitely see the initiatives towards organic farming, cultivation of medicinal plants and pisciculture in the water bodies in future where our scientific endeavours will merge with the needs of society more directly. 

Every scientific discovery leads to a nice story of life in nature that enthrals people in general. Data centric validation of the journey from observation to inference may pose to be the most important part of a scientific endeavour but it miserably fails to attract the layman’s mind and in turn, makes science significantly dull to the non-practitioners. 
#image("/covers/tisha.jpeg", width: 100%, height: 20%, fit: "cover")#text(fill: header-dark-color, weight: "black", [New research in fruit flies shows that resveratrol can protect brain cells against Sly syndrome. Check article by #pageLink(<Tisha-Cleanup>, underline[Tisha]).])
#colbreak()
#image("/covers/coraballcoverSmall.jpeg", width: 100%, height: 20%, fit: "cover")#text(fill: header-dark-color, weight: "black", [The Cora Ball uses hydrodynamics to trap microfibres released from laundry. Sharanya Chatterjee takes you through the journey through her #pageLink(<Sharanya-Second>, underline[article]).])

You must connect your objectives and validate them with your feelings before getting indulged on populating data sheets to establish observations into theories. End of the day, you must ensure that the general audience can connect them to your accomplishment, 

It is shocking to see the cat and mouse race in modern-day science. Unfortunately, true advance of science is getting greatly affected by data manipulation, unethical exaggeration of facts and plagiarism. Time has come to retrospect and rejuvenate the pleasure of science beyond impact factor and accolades. I am sure that the breakthrough will come soon with the vibrant youth starving for the nectar of true ground breaking science. 

My heartfelt gratitude to those who are behind the successful journey of the IISER Kolkata science magazine, InScight. It is a wonderful platform to express the feelings behind every scientific accomplishment beyond the boundaries of word limit, page counts or acceptable formats that are somewhat limiting the profound joy of scientific story telling. It will keep our glorious past live through down memory lane stories, excite the readers with scientific happenings today and stimulate the young brains towards many more successful endeavours in future.   
#sign([Prof. Balaram Mukhopadhyay,\ Department of Chemical Sciences,\ IISER Kolkata])
])
)
