#import "@preview/touying:0.5.2": *
#import themes.stargazer: *
#import "@preview/tiaoma:0.2.0": *
#import "@preview/colorful-boxes:1.3.1": *
#import "@preview/prooftrees:0.1.0": *

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

#let myaxi(body) = axi(pad(bottom: 6pt, top: 6pt, body))
#let myuni(body) = uni(pad(bottom: 6pt, top: 6pt, body))
#let mybin(body) = bin(pad(bottom: 6pt, top: 6pt, body))

#title-slide()

#outline-slide()

= まえおき

== 自己紹介

- 谷口雅弥 (博士(情報科学, JAIST))
- 理化学研究所 革新知能統合研究センター 自然言語理解チーム
- 東北大学 自然言語処理研究グループ
- 形式言語理論(範疇文法)・数理論理学(部分構造論理)

== 配布スライド

#slide[
  #set align(center)
  `https://tani-mss.github.io/onjuku2024/slide.pdf`
  #qrcode(
    "https://tani-mss.github.io/onjuku2024/slide.pdf",
    options: (scale: 4.0)
  )
]

= 背景: ランベック計算と文脈自由文法

== ランベック計算の紹介

#outline-colorbox(title: [ランベック計算 (Lambek, 1958) $bold(L)^bullet$])[
  #v(5pt)
  小文字のアルファベットは原子論理式とする。
  小文字のギリシャ文字は式 ($phi := a | phi slash phi | phi backslash phi$) であり大文字のギリシャ文字は式の列である。推論規則は以下。
#grid(
  columns: (200pt,) * 3,
  column-gutter: 50pt,
  row-gutter: 10pt,
  tree(
    myaxi[],
    myuni[$alpha => alpha$]
  ),
  tree(
    myaxi[$Sigma, alpha => beta$],
    myuni[$Sigma => beta slash alpha$],
  ),
  tree(
    myaxi[$alpha,Sigma => beta$],
    myuni[$Sigma => alpha backslash beta$],
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => alpha$],
    mybin[$Gamma,Sigma,Delta => beta$]
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => gamma$],
    mybin[$Gamma,alpha slash gamma, Sigma,Delta => beta$]
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => gamma$],
    mybin[$Gamma,Sigma,gamma backslash alpha,Delta => beta$]
  ),
  tree(
    myaxi[$Gamma,alpha,beta,Delta => beta$],
    myuni[$Gamma,alpha bullet beta,Delta => beta$],
  ),
  tree(
    myaxi[$Gamma => alpha$],
    myaxi[$Delta => beta$],
    mybin[$Gamma,Delta => alpha bullet beta$],
  ),
)
]

== プロダクトフリーランベック計算
#outline-colorbox(title: [プロダクトフリーランベック計算 $bold(L)$])[
  #v(5pt)
  小文字のアルファベットは原子論理式とする。
  小文字のギリシャ文字は式 ($phi := a | phi slash phi | phi backslash phi$) であり大文字のギリシャ文字は式の列である。推論規則は以下。
  #grid(
    columns: (200pt,) * 3,
    column-gutter: 50pt,
    row-gutter: 10pt,
    tree(
      myaxi[],
      myuni[$a => a$]
    ),
    tree(
      myaxi[$Sigma, alpha => beta$],
      myuni[$Sigma => beta slash alpha$],
    ),
    tree(
      myaxi[$alpha,Sigma => beta$],
      myuni[$Sigma => alpha backslash beta$],
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => alpha$],
      mybin[$Gamma,Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,alpha slash gamma, Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,Sigma,gamma backslash alpha,Delta => beta$]
    )
  )
]

#outline-colorbox(title: [カット除去定理 (Lambek 1958)])[
  #v(5pt)
  $L$ は規則の集合とする。
  $L in {bold(L),bold(L)^bullet};[L tack Gamma => alpha quad <==> quad L backslash {"cut"} tack Gamma => alpha]$
]

== 文脈自由文法

#outline-colorbox(title: [文脈自由文法])[
  #v(5pt)
  大文字は非終端記号、小文字は終端記号とする。このとき、$A <- a$, $A <- B C$ で書かれる文法規則の集合を文脈自由文法とする。\ (一般には、もと緩く定義できるが、チョムスキー標準形を採用する)
]

#outline-colorbox(title: [文脈自由言語])[
  #v(5pt)
  文法にもとづいた書き換えによって生成される終端記号の列 (文)の集まりを言語と呼び、とくに文脈自由文法にもとづく言語を文脈自由言語とよぶ。
]

== 文脈自由文法との対応

ランベック計算の体系を$bold(L) = {"Ax", "Cut", "I" slash, "I" backslash, slash "I", backslash "I"}$と表記する。

#outline-colorbox(title: [Language $frak(L)(ell,L)$])[
  #v(5pt)
  $bb(C)$ は式。$ell$ は語彙$Sigma arrow.r cal(P)(bb(C))$であり$[dot]_i$は選択$cal(P)(bb(C)) arrow.r bb(C)$。言語 $frak(L)$ は以下の通り:
$
frak(L)(ell, L,s) = {w_1,w_2,dots,w_n | exists [dot]_1,[dot]_2,dots,[dot]_n; L tack [ell(w_1)]_1, [ell(w_2)]_2,dots,[ell(w_n)]_n arrow.r.double s}
$
]

#outline-colorbox(title: [Pentus 1993, 1997])[
  #v(5pt)
$frak(L)(ell, bold(L),s)$ は文脈自由言語; つまり $sans(L)$は文脈自由言語 iff. $exists ell[sans(L)=frak(L)(ell, bold(L), s)]$
]

#outline-colorbox(title: [言語のカット除去定理(谷口))])[
  #v(5pt)
  カット除去定理から次が直ちに導かれる。$frak(L)(ell, L, s) = frak(L)(ell, L backslash {"cut"}, s)$
]

== ランベック計算と文脈自由文法の関係

= ランベック計算と線形文法、正規文法

== ランベック文法の断片

#v(15pt)
#outline-colorbox(title: [ランベック計算の右断片 $bold(L)(backslash)$])[
  #v(5pt)
  小文字のアルファベットは原子論理式とする。
  小文字のギリシャ文字は式 ($phi := a | phi slash phi | phi backslash phi$) であり大文字のギリシャ文字は式の列である。推論規則は以下。
  #grid(
    columns: (200pt,) * 3,
    column-gutter: 50pt,
    row-gutter: 10pt,
    tree(
      myaxi[],
      myuni[$a => a$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => alpha$],
      mybin[$Gamma,Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,Sigma,gamma backslash alpha,Delta => beta$]
    )
  )
]
#outline-colorbox(title: [ランベック計算の左断片 $bold(L)(slash)$])[
  #v(5pt)
  小文字のアルファベットは原子論理式とする。
  小文字のギリシャ文字は式 ($phi := a | phi slash phi | phi backslash phi$) であり大文字のギリシャ文字は式の列である。推論規則は以下。
  #grid(
    columns: (200pt,) * 3,
    column-gutter: 50pt,
    row-gutter: 10pt,
    tree(
      myaxi[],
      myuni[$a => a$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => alpha$],
      mybin[$Gamma,Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,alpha slash gamma, Sigma,Delta => beta$]
    ),
  )
]

#outline-colorbox(title: [ランベック計算の断片 $bold(L)(slash,backslash)$])[
  #v(5pt)
  小文字のアルファベットは原子論理式とする。
  小文字のギリシャ文字は式 ($phi := a | phi slash phi | phi backslash phi$) であり大文字のギリシャ文字は式の列である。推論規則は以下。
  #grid(
    columns: (60pt,150pt,150pt,150pt),
    column-gutter: 50pt,
    row-gutter: 10pt,
    tree(
      myaxi[],
      myuni[$a => a$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => alpha$],
      mybin[$Gamma,Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,alpha slash gamma, Sigma,Delta => beta$]
    ),
    tree(
      myaxi[$Gamma,alpha,Delta => beta$],
      myaxi[$Sigma => gamma$],
      mybin[$Gamma,Sigma,gamma backslash alpha,Delta => beta$]
    )
  )
]
#outline-colorbox(title: [カット除去定理(Zielonka 1976)])[
  #v(5pt)
  $L$ は規則の集合。
  $L in {bold(L)(slash),bold(L)(backslash), bold(L)(slash,backslash)};[L tack Gamma => alpha <==> L backslash {"cut"} tack Gamma => alpha]$
]

#outline-colorbox(title: [言語のカット除去定理(谷口))])[
  #v(5pt)
  カット除去定理から次が直ちに導かれる。$frak(L)(ell, L, s) = frak(L)(ell, L backslash {"cut"}, s)$
]

== 線形文法

#outline-colorbox(title: "線形文法")[
  #v(5pt)
  $A <- a$, $A <- a B$, $A <- B a$の形で書かれる文法を線形文法と呼ぶ。
]

#outline-colorbox(title: "右・左線形文法 (正規文法)")[
  #v(5pt)
  以下の線形文法の断片は正規文法に対応する。
  - $A <- a$, $A <- B a$ で書かれる文法を左線形文法とする。
  - $A <- a$, $A <- a B$ で書かれる文法を右線形文法とする。
]

#outline-colorbox(title: [線形文法かつ正規文法でない例])[
  #v(5pt)
  以下より線形文法は正規文法だけでなく、文脈自由文法の一部も表現している。
  $
  A <- a B quad B <- A b quad B <- b quad quad sans(L) = {a^n b^n|n >= 1}
  $
  文脈自由文法以下の表現力であることは定義から直ちに導かれる。
]
#v(-15pt)

== 式の次数と語彙

式のうち演算子 $slash, backslash$ の数を式の次数と呼ぶ。\
語彙 $ell_1$ は 語彙のうち式の次数が1のものに限定したものとする。\
語彙 $ell_(1slash)$ と $ell_(1backslash)$ は それぞれ演算子も制限したものである。

#outline-colorbox(title: [正規文法とランベック計算の断片])[
  #v(5pt)
$sans(L)$ は正規言語とする。$exists ell_(1slash); sans(L) = frak(L)(ell_(1slash), L(slash), s)$ かつ $exists ell_(1backslash);sans(L) = frak(L)(ell_(1backslash), L(backslash), s)$
]

#outline-colorbox(title: [線形文法とランベック計算の断片])[
  #v(5pt)
$sans(L)$ は線形言語とする。このとき $exists ell_1; sans(L) = frak(L)(ell_1, L(slash,backslash), s)$
]
上記を証明する。

// #slide[
// = Fragment of the calculus which is weaker than Lambek calculus
// #definition("Restriction on lexicon")[
//   The following lexicons are lexicons which restrict co-domains to $cal(P)(bb(C)|_L)$ and $cal(P)(bb(C)|_R)$.
// $
// ell|_L: Sigma arrow.r cal(P)(bb(C)|_L);quad 
// ell|_R: Sigma arrow.r cal(L)(bb(C)|_R);
// $
// where the restricted co-domain are defined as;
// $
// bb(C)|_L = "ATOM" union { A slash B | A, B in "ATOM" }; quad
// bb(C)|_R = "ATOM" union { A backslash B | A, B in "ATOM" }
// $
// ]
// #theorem([Regular lexicons: $ell|_L$, $ell|_R$])[
// $frak(L)(ell|_L, bold(L)(slash))$ and $frak(L)(ell|_R, bold(L)(backslash))$ are regular and has no empty $epsilon$; i.e.,
// the followings are equivalent to that $sans(L)$ is a regular language except $epsilon$;
// $
// exists ell|_L\[ sans(L) = frak(L)(ell|_L, bold(L)(slash), s)];
// quad
// exists ell|_R\[ sans(L) = frak(L)(ell|_R, bold(L)(backslash), s)]
// $
// ]
// ]
// #slide[
// #proof[
//   We prove the case: $L=frak(L)(ell|_L, bold(L)(slash),s)$.
//   Let be $G$ a right linear grammar of $L$.
//   Then, the member of $G$ forms $X arrow.l a Y$ or $X arrow.l a$, where capital letters are non-terminals, and small letters are terminals. Then, the lexicon is $X slash Y in ell|_(L)(a)$ and $X in ell|_(L)(a)$, respectively.
//   
//   *BASE CASE:* if $a$ is a member of language; i.e, $s arrow.l a$, then $a in frak(L)(ell|_(L), L(slash),s)$ because $L(slash) tack s arrow.r.double s$ that is $L(slash) tack ell|_(L)(a) arrow.r.double s$.
//   
//   *INDUCTIVE STEP:* the category of $overline(w)$ is $Y$ and concatenated string $a overline(w)$ is $X$. Then the grammar is $X arrow.l a Y$.
//   According to the inductive hypothesis, $overline(w) in frak(L)(ell|_(L),L(slash), Y); L(slash) tack ell|_(L)(overline(w)) arrow.r.double Y$. Here, we add the new lexical entry $X slash Y in ell|_(L)(a)$.  Then, we have $a overline(w) in frak(L)(ell|_(L), L(slash), X)$ because $L(slash) tack ell|_(L)(a), ell|_(L)(overline(w))arrow.r.double X; L(slash) tack X slash Y, Y arrow.r.double X$.
//   
//   *CONVERSE STATEMENT:* $X slash Y in ell|_(L)(a)$ is transformed to $X arrow.l a Y$ and $X in ell|_(L)(a)$ is transformed to $X arrow.l a$. Then, this is a right linear grammar and by the same inductive proof, we have the converse statement.
// ]
// ]

== ランベック計算と線形文法、正規文法
カット除去定理からsubformula property が性質する。
すなわち 

= 相談: 古典論理への埋め込み

ランベック計算

#grid(
  columns: (200pt,) * 3,
  column-gutter: 50pt,
  tree(
    myaxi[],
    myuni[$a => a$]
  ),
  tree(
    myaxi[$Sigma, alpha => beta$],
    myuni[$Sigma => beta slash alpha$],
  ),
  tree(
    myaxi[$alpha,Sigma => beta$],
    myuni[$Sigma => alpha backslash beta$],
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => alpha$],
    mybin[$Gamma,Sigma,Delta => beta$]
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => gamma$],
    mybin[$Gamma,alpha slash gamma, Sigma,Delta => beta$]
  ),
  tree(
    myaxi[$Gamma,alpha,Delta => beta$],
    myaxi[$Sigma => gamma$],
    mybin[$Gamma,Sigma,gamma backslash alpha,Delta => beta$]
  ),
)

ランベック計算の原子論理式に添字を加えると次の同値関係が導かれる (?)

$
exists Delta prec.eq Gamma;bold(L) tack Delta => alpha quad <==> quad "LK" tack bracket.b => [|Gamma => alpha|]
$

$
[|alpha_1,dots,alpha_n=>beta|] := [|alpha_1|]_1 and dots and [|alpha_n|]_n ->[|beta|]_1 or dots or [|beta|]_n \
[|alpha slash beta|]_i := [|beta|]_(i+1) -> [|alpha|]_i quad quad quad
[|alpha backslash beta|]_i := [|alpha|]_(i-1) -> [|beta|]_i quad quad quad
[|a|]_i := a_i
$

= まとめ

- ランベック計算 + 無制限の語彙 は 文脈自由文法
- ランベック計算 + 次数 1 の語彙は 線形文法 (New!)
- ランベック計算 + 次数1で$slash$のみの語彙は 正規文法
- ランベック計算 + 次数1で$backslash$のみの語彙は 正規文法
- ランベック計算を古典論理上でシミュレーションする方法を模索中