#import "@preview/touying:0.5.2": *
#import themes.stargazer: *
#import "@preview/tiaoma:0.2.0": *

#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Lorem Ipsum],
    subtitle: [dolor sit amet, consectetur adipiscing elit],
    author: [sed do eiusmod],
    date: datetime.today(),
    institution: [tempor incididunt ut labore]
  ),
)

// For Japanese
// #set text(font: "Noto Serif CJK JP", lang: "ja")
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Noto Serif CJK JP", lang: "ja")

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide()

= Section A

== Subsection A.1

#slide[
  #set align(center)
  This slide is available at \
  `https://github.com/tani/gitpod-typst`
  #qrcode(
    "https://github.com/tani/gitpod-typst",
    options: (scale: 4.0)
  )
]

#slide[
  A slide with equation:

  $ x_(n+1) = (x_n + a/x_n) / 2 $
]

== Subsection A.2

#slide[
  A slide without a title but with *important* infos
]

= Section B

== Subsection B.1

#slide[
  #lorem(80)
]

#focus-slide[
  Wake up!
]

== Subsection B.2

#slide[
  We can use `#pause` to #pause display something later.

  #pause
  
  Just like this.

  #meanwhile
  
  Meanwhile, #pause we can also use `#meanwhile` to #pause display other content synchronously.
]