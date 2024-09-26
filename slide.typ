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
#set text(font: "Hiragino Kaku Gothic ProN", lang: "ja")
// #set text(font: "Harano Aji Gothic", lang: "ja")
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

#focus-slide[
  論理学のはなし
]

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

#focus-slide[
  言語のはなし
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
$frak(L)(ell, bold(L),s)$ は文脈自由言語; つまり $sans(L)$は文脈自由言語 iff. $exists ell[sans(L)=frak(L)(ell, bold(L), S)]$
]

#outline-colorbox(title: [言語のカット除去定理(谷口))])[
  #v(5pt)
  カット除去定理から次が直ちに導かれる。$frak(L)(ell, L, S) = frak(L)(ell, L backslash {"cut"}, S)$
]

== ランベック計算と文脈自由文法の関係

= ランベック計算と線形文法、正規文法

#focus-slide[
  論理のはなし
]

== ランベック文法の断片

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
  $L in {bold(L)(slash,backslash)};[L tack Gamma => alpha <==> L backslash {"cut"} tack Gamma => alpha]$
]

#outline-colorbox(title: [言語のカット除去定理(谷口))])[
  #v(5pt)
  カット除去定理から次が直ちに導かれる。$frak(L)(ell, L, S) = frak(L)(ell, L backslash {"cut"}, S)$
]

#focus-slide[
  言語のはなし
]

== 線形文法

#outline-colorbox(title: "線形文法")[
  #v(5pt)
  $A <- a$, $A <- a B$, $A <- B a$の形で書かれる文法を線形文法と呼ぶ。\
  もう少し緩い定義が一般的であるが、ここでは標準形として、これを採用する。\
  一般には、規則の両辺に非終端記号が高々一つしか表われない文法規則である。
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

#outline-colorbox(title: [線形文法とランベック計算の断片])[
  #v(5pt)
式のうち演算子 $slash, backslash$ の数を式の次数と呼ぶ。\
語彙 $ell_1$ は 語彙のうち式の次数が高々1のものに限定したものとする。\
$sans(L)$ は線形言語とする。このとき $exists ell_1; sans(L) = frak(L)(ell_1, L(slash,backslash), S)$
]

*ランベック計算の断片と制約された語彙* は線形文法である!

== 線形文法とランベック計算の断片の関係の証明

#outline-colorbox(title: [主張])[
 #v(5pt)
言語 $sans(L)_X$ は線形文法で生成される。ルートとなる非終端記号は$X$である。\
このとき、$s in L_X <==> s in frak(L)(ell_1,L(slash,backslash), X) $ となる語彙 $ell_1$が存在する。
]


#outline-colorbox(title: [言語 $==>$ 論理])[
  #v(5pt)
  *ベースケース* 長さが 1のとき$a in L_A$とする。
  対応する文法規則は $A <- a$ である。$ell_1$ は $ell_1(a) = A$ とする。
  このとき $s in frak(L)(ell_1, L(slash,backslash), A)$ が成り立つ。

  *帰納ステップ*
  長さが1より大きいとき、文法規則の形から
  その文字列は $a overline(w)$  もしくは $overline(w) a$のどちらかに分割される。

  #v(30pt)

  *帰納ステップ 1* 長さが $n$ のとき、$a overline(w) in L_A$ とする。$overline(w)$ の長さが $n-1$ であるとする。
  帰納法の仮定から $overline(w) in L_W ==> overline(w) in frak(L)(ell_1,L(slash,backslash), W)$。
  対応する文法規則は $A <- a W$ である。$ell_1$ は $ell_1(a) = A slash W$ とする。
  #tree(
    myaxi[$[ell_1(overline(w))]=>W$],
    myaxi[$A=>A$],
    mybin[$A slash W, [ell_1(overline(w))] => A$],
    myuni[$[ell_1(a)], [ell_1(overline(w))] => A$],
    myuni[$[ell_1(a overline( w))] => A$]
  )
  したがって、証明図より $a overline(w) in frak(L)(ell_1, L(slash, backslash), A)$ である。

  *帰納ステップ 2* 長さが $n$ のとき、$overline(w) a in L_A$ とする。$overline(w)$ の長さが $n-1$ であるとする。
  帰納法の仮定から $overline(w) in L_W ==> overline(w) in frak(L)(ell_1,L(slash,backslash), W)$。
  対応する文法規則は $A <- W a$ である。$ell_1$ は $ell_1(a) = W backslash A$ とする。
#tree(
  myaxi[$[ell_1(overline(w))]=>W$],
  myaxi[$A=>A$],
  mybin[$[ell_1(overline(w))], W backslash A => A$],
  myuni[$[ell_1(overline(w))], [ell_1(a)] => A$],
  myuni[$[ell_1( overline(w) a)] => A$]
)
したがって、証明図より $overline(w) a in frak(L)(ell_1, L(slash, backslash), A)$ である。

$tack.l$
]
#pagebreak()

#outline-colorbox(title: [論理 $==>$ 言語])[
#v(5pt)
 *ベースケース* 長さが1のとき $L(slash,backslash) tack [ell_1(a)] => A$ すなわち $ell_1(a) = A$ である。
 このとき、文法規則 $A <- a$ と置けば $a in L_A$である。

 *帰納ステップ* 長さが $n$ のとき文字列 $overline(w)$ を考える。 $[ell_1(overline(w))] => A$ とする。
 このとき、推論規則の形から最下段のシーケントは $A slash W, Gamma => A$ もしくは\ $Gamma, W backslash A => A$ のどちらかである。

#v(0pt)
 *帰納ステップ1* $A slash W, Gamma => A$ とする。このとき $A => A$ と $ Gamma => W$ の二つに分け分けられる。
文字列が $a overline(w)$ の形をしているなら帰納法の仮定から語彙から $overline(w) in L_W$に関する文法規則 $cal(G)$ を作ることができてそれに $A <- a W$を加えることができ $a overline(w) in L_A$

 *帰納ステップ2* $Gamma, W backslash A => A$ とする。このとき $A => A$ と $ Gamma => W$ の二つに分け分けられる。
文字列が $overline(w) a$ の形をしているなら帰納法の仮定から語彙から $overline(w) in L_W$に関する文法規則 $cal(G)$ を作ることができてそれに $A <- W a$を加えることができ $a overline(w) in L_A$ 

$tack.l$
]

したがって以上より、どんな文字列 $overline(w)$ に対しても、$overline(w) in sans(L)_X <==> overline(w) in frak(L)(ell_1, L(slash,backslash), X)$ である。


== 線形文法とランベック計算

1. $L(slash,backslash)$ に新たに 右導入規則を加えた普通のランベック計算 $bold(L)$を考える
2. カットフリーの過程のみを考える
3. $overline(s) in frak(L)(ell_1, bold(L), S)$ に対応する証明の最下段$sigma$は $[ell_1(w_1)],dots,[ell_1(w_n)]=> S$
4. $sigma$へ至る証明内での右導入規則を仮定。もっとも下層での右導入規則に注目
5. この右辺を $alpha$ とする。$d(alpha) >= 1$ である。
6. $alpha$は以下の4つの方法で処理される
  1. そのまま残る (3によって棄却される)
  2. 右導入規則に用いられる (4によって棄却される)
  3. カット導入規則に用いられる (2によって棄却される)
  4. 左導入規則に用いられる
#pagebreak( )
7. 4の場合を考える。この場合注目している式 $eta$ の次数は $d(alpha) + 1$以上となる。
8. $eta$ は以下の4つの方法によって処理される。
  1. そのまま残る (3によって棄却される)
  2. カット導入規則に用いられる (2によって棄却される)
  3. 左導入規則に用いられる
9. 3の場合、その注目した式に 7 の議論を繰替えされる。
10. 9のループでは、次数が単調増加する。しかし、これは 2 の仮定に反する。
11. したがって、 4の仮定が棄却される。

ゆえに $overline(s) in frak(L)(ell_1, bold(L), S)$ において 右導入規則が使われることはなく、
加えてもその言語が拡張されることはない。つまり $frak(L)(ell_1, bold(L), S) = frak(L)(ell_1, L(slash, backslash), S)$。\
言語上で右導入規則は許容可能 (addmissible)である。

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
