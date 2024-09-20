#import "@preview/touying:0.5.2": *
#import themes.stargazer: *
#import "@preview/tiaoma:0.2.0": *
#import "@preview/colorful-boxes:1.3.1": *

#import "@preview/numbly:0.1.0": numbly

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [ランベック計算と古典論理と線形文法],
    subtitle: [線形文法との対応と古典論理への埋め込み],
    author: [谷口雅弥],
    date: datetime.today(),
    institution: [理化学研究所]
  ),
)

// For Japanese
#set text(font: "Harano Aji Gothic", lang: "ja")
// #set text(font: "Harano Aji Mincho", lang: "ja")
// #show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Noto Serif CJK JP", lang: "ja")

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide()

= まえおき

== 自己紹介

- 谷口雅弥 (博士(情報科学, JAIST))
- 理化学研究所 革新知能統合研究センター 自然言語理解チーム
- 東北大学 自然言語処理研究グループ
- 形式言語理論(範疇文法)・証明論(部分構造論理)

== 配布スライド

#slide[
  #set align(center)
  `https://tani-mss.github.io/onjuku2024/slide.pdf`
  #qrcode(
    "https://tani-mss.github.io/onjuku2024/slide.pdf",
    options: (scale: 4.0)
  )
]

= ランベック計算の紹介

#outline-colorbox(title: "ランベック計算 (Lambek, 1958)")[
  #v(5pt)
]

#outline-colorbox(title: "プロダクトフリーランベック計算 (Lambek, 1958)")[
  #v(5pt)
]

= 線形文法との対応

#outline-colorbox(title: "線形文法")[
  #v(5pt)
]

#outline-colorbox(title: "片側線形文法")[
  #v(5pt)
]

= 古典論理への埋め込み

#outline-colorbox(title: "古典論理")[
  #v(5pt)
]

= Lambek/SMT の実装

= まとめ