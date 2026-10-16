#let margin = eval(sys.inputs.at("margin", default: "1in"))
#let fontsize = eval(sys.inputs.at("fontsize", default: "11pt"))
#let lead = eval(sys.inputs.at("lead", default: "1.0em"))

#set page(
  paper: "us-letter",
  margin: (x: margin, top: 1in, bottom: 1in),
)
#set text(font: "Palatino", size: fontsize)
#set par(justify: true, leading: lead, spacing: 0.9em)
#set math.equation(numbering: none)

#let blue = rgb("#0000ff")

#let eqsp = eval(sys.inputs.at("eqsp", default: "1.8em"))
#show math.equation.where(block: true): set block(spacing: eqsp)

// ---------------- Title block (page 1) ----------------
#align(center)[
  #v(10pt)
  #text(size: 12.5pt, weight: "bold")[
    Reply to \
    Comment on \"Multiparty quantum mutual information: An alternative definition\"
  ]

  #v(16pt)
  #text(size: 12.5pt)[Asutosh#h(0.4em)Kumar#super[1,\u{2009}\u{2217}]]

  #v(14pt)
  #text(size: 11pt, style: "italic")[#super[1]Department of Physics, Gaya College, Magadh University, Rampur, Gaya 823001, India]
]

#v(10pt)

#pad(left: 0.55in, right: 0.55in)[
  We reaffirm the claim of Lee _et al._ [preceding Comment, Phys. Rev. A *108*, 066401 (2023)] that the expression of quantum dual total correlation of a multipartite system in terms of quantum relative entropy as proposed in previous work [A. Kumar, Phys. Rev. A *96*, 012332 (2017)] is not correct. We provide alternate expression(s) of quantum dual total correlation in terms of quantum relative entropy. We, however, prescribe that in computing quantum dual total correlation one should use its expression in terms of von Neumann entropy.
]

// footnote-style email at bottom of page 1
#place(bottom + left, dy: -6pt)[
  #line(length: 20%, stroke: 0.4pt)
  #v(2pt)
  #text(size: 10pt)[#super[\u{2217}] asutoshk.phys\@gmail.com]
]

#pagebreak()

// ---------------- Page 2: Introduction ----------------
#align(center)[#text(weight: "bold")[I.#h(1em)INTRODUCTION]]
#v(6pt)

In Ref.~[1] two different expressions of quantum dual total correlation were obtained: one in terms of von Neumann entropy and other in terms of quantum relative entropy. It was claimed that the two expressions are equivalent. In a comment [2] on Ref.~[1], Lee _et al._ have shown that the quantum dual total correlation of an $n$-partite quantum state cannot be represented as the quantum relative entropy between $(n-1)$ copies of the quantum state and the product of $n$ different reduced quantum states for $n >= 3$. They arrived at this conclusion by considering explicitly the \"support\" condition of quantum relative entropy. Essentially, what Lee _et al._ have shown is that the following two expressions are not equal for $n >= 3$:

$ I_n (rho) := sum_(k=1)^n S(rho_(macron(k))) - (n-1) S(rho), #h(1fr) (1) $

where $rho_(macron(k)) = t r_k (rho)$ denotes the $(n-1)$-partite quantum state obtained by taking the partial trace on the $k^(t h)$ party of $rho$, and

$ J_n (rho) := S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(macron(k))), #h(1fr) (2) $

where the quantum relative entropy is

$ S(tau || sigma) := cases(
  t r (tau log tau) - t r (tau log sigma) & "if " s u p p(tau) subset.eq s u p p(sigma),
  infinity & "otherwise."
) $

To justify their claim, authors provide two examples which imply that the above two expressions of $n$-partite quantum mutual information are not equivalent. $I_n (rho)$ in Eq.~(1) is non-negative and non-increasing under local CPTP maps [3], and therefore is a suitable monotonic measure of multi-partite correlations, while $J_n (rho)$ in Eq.~(2) is not.

#v(10pt)
#align(center)[#text(weight: "bold")[II.#h(1em)REAFFIRMING CLAIM OF LEE _ET AL._]]
#v(6pt)

The claim of Lee _et al._ is right. In this article we show analytically why the above two expressions are not equivalent. We begin with expression of $I_n (rho)$ [Eq.~(1)] and proceed to show that this is not equal to $J_n (rho)$ [Eq.~(2)], as argued below.

#pagebreak()

// ---------------- Page 3 ----------------
$
I_n (rho) & = sum_(k=1)^n S(rho_(macron(k))) - (n-1) S(rho) \
& = sum_(k=1)^n (S(rho_k) + S(rho_(macron(k))) - S(rho)) - (sum_(k=1)^n S(rho_k) - S(rho)) \
& = sum_(k=1)^n S(rho || rho_k ⊗ rho_(macron(k))) - S(rho || ⊗_(k=1)^n rho_k) #h(1fr) (3) \
& = S(rho^(⊗ n) || ⊗_(k=1)^n (rho_k ⊗ rho_(macron(k)))) - S(rho || ⊗_(k=1)^n rho_k) #h(1fr) (4) \
& attach(=, t: \?) #text(fill: blue)[$S(rho ⊗ rho^(⊗ (n-1)) || (⊗_(k=1)^n rho_k) ⊗ (⊗_(k=1)^n rho_(macron(k))))$] - S(rho || ⊗_(k=1)^n rho_k) #h(1fr) (5) \
& = S(rho || ⊗_(k=1)^n rho_k) + S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(macron(k))) - S(rho || ⊗_(k=1)^n rho_k) \
& = S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(macron(k))) = J_n (rho), #h(1fr) (6)
$

where quantum relative entropy in Eq.~(3) and Eq.~(4) is properly matched to satisfy the \"support\" condition in the sense that

$
S(rho || ⊗_(k=1)^n rho_k) & equiv S(rho_(1 2 dots.c n) || ⊗_(k=1)^n rho_k) \
S(rho || rho_k ⊗ rho_(macron(k))) & equiv S(rho_(k macron(k)) || rho_k ⊗ rho_(macron(k))) \
S(rho^(⊗ n) || ⊗_(k=1)^n (rho_k ⊗ rho_(macron(k)))) & equiv S(rho_(1 2 dots.c n) ⊗ rho_(2 3 dots.c n 1) ⊗ dots.c ⊗ rho_(n 1 dots.c (n-1)) || ⊗_(k=1)^n (rho_k ⊗ rho_(macron(k)))),
$

where $macron(1) = 2 3 dots.c n$, $macron(2) = 3 4 dots.c n 1$ and $macron(k) = (k+1) dots.c n 1 dots.c (k-1)$. Eq.~(3) and Eq.~(4) are alternate expressions equivalent to Eq.~(1) in terms of quantum relative entropy. We, however, prescribe to use Eq.~(1) in computing quantum dual total correlation. Eq.~(5) is not correct for two reasons: (i) noncommutativity of tensor product, and (ii) \"matching\" issue of subsystems. Therefore, we cannot arrive at Eq.~(6).

#v(10pt)
#align(center)[#text(weight: "bold")[III.#h(1em)SECOND REBUTTAL]]
#v(6pt)

Let us reconsider Eq.~(2) for $n=3$ explicitly.

$
J_3 (rho) & = S(rho^(⊗ 2) || ⊗_(k=1)^3 rho_(macron(k))) \
& = S(rho_(123) ⊗ rho_(123) || rho_(23) ⊗ rho_(31) ⊗ rho_(12)). #h(1fr) (7)
$

Here we see that the subsystems in the first and the second arguments of the quantum relative entropy are not properly matched. However, the subsystems in the above expression could be matched up if we adopt the following conventions: (i) interpret the first argument in the usual way, with the subsystems in their standard order and (ii) interpret the tensor product in the

#pagebreak()

// ---------------- Page 4 ----------------
second argument with the values of $k$ running from $n$ to 1. That is, for $n=3$, if we define

$
tilde(J)_3 (rho) & := S(rho^(⊗ 2) || ⊗_(k=3)^1 rho_(macron(k))) \
& = S(rho_(123) ⊗ rho_(123) || rho_(12) ⊗ rho_(31) ⊗ rho_(23)), #h(1fr) (8)
$

then we see that the subsystems are properly matched. Now, let us adopt the following notations:

$
rho_(123)^(⊗ 2) & = rho_(123) ⊗ rho_(123) equiv rho_(A_1 A_2 A_3) ⊗ rho_(B_1 B_2 B_3) equiv rho_(123) ⊗ rho_(456), #h(1fr) (9) \
⊗_(k=3)^1 rho_(macron(k)) & = rho_(12) ⊗ rho_(31) ⊗ rho_(23) equiv rho_(A_1 A_2) ⊗ rho_(A_3 B_1) ⊗ rho_(B_2 B_3) equiv rho_(12) ⊗ rho_(34) ⊗ rho_(56). #h(1fr) (10)
$

Then, using notations in Eqs.~(9, 10), one might attempt to show that Eq.~(8) is equivalent to $I_3 (rho) = sum_(k=1)^3 S(rho_(macron(k))) - 2 S(rho)$ as argued below.

$
tilde(J)_3 (rho) & := S(rho^(⊗ 2) || ⊗_(k=3)^1 rho_(macron(k))) \
& = S(rho_(123) ⊗ rho_(123) || rho_(12) ⊗ rho_(31) ⊗ rho_(23)) \
& equiv S(rho_(123) ⊗ rho_(456) || rho_(12) ⊗ rho_(34) ⊗ rho_(56)) \
& = - t r (rho_(123) ⊗ rho_(456) log (rho_(12) ⊗ rho_(34) ⊗ rho_(56))) + t r (rho_(123) ⊗ rho_(456) log (rho_(123) ⊗ rho_(456))) \
& = - t r (rho_(123) ⊗ rho_(456) log (rho_(12) ⊗ I_(34) ⊗ I_(56))) - t r (rho_(123) ⊗ rho_(456) log (I_(12) ⊗ rho_(34) ⊗ I_(56))) \
& - t r (rho_(123) ⊗ rho_(456) log (I_(12) ⊗ I_(34) ⊗ rho_(56))) + t r (rho_(123) ⊗ rho_(456) log (rho_(123) ⊗ I_(456))) + t r (rho_(123) ⊗ rho_(456) log (I_(123) ⊗ rho_(456))) \
& = - t r_(12) (rho_(12) log rho_(12)) #text(fill: blue)[$- t r_(34) (rho_3 ⊗ rho_4 log rho_(34))$] - t r_(56) (rho_(56) log rho_(56)) + t r_(123) (rho_(123) log rho_(123)) + t r_(456) (rho_(456) log rho_(456)) \
& attach(=, t: \?) S(rho_(12)) + #text(fill: blue)[$S(rho_(34))$] + S(rho_(56)) - S(rho_(123)) - S(rho_(456)) #h(1fr) (11) \
& equiv S(rho_(12)) + S(rho_(31)) + S(rho_(23)) - 2 S(rho_(123)) = I_3 (rho). #h(1fr) (12)
$

But this is not correct because the second term in Eq.~(11) cannot be obtained from the previous equation.

Thus, even if we define quantum dual total correlation of a multipartite system in terms of quantum relative entropy alternatively as

$ tilde(J)_n (rho) := S(rho_(1 2 dots.c n)^(⊗ (n-1)) || ⊗_(k=n)^1 rho_(macron(k))), #h(1fr) (13) $

and use the notations as discussed above, Eq.~(13) is not equivalent to Eq.~(1).

#pagebreak()

// ---------------- Page 5: Acknowledgments + refs ----------------
#align(center)[#text(weight: "bold")[ACKNOWLEDGMENTS]]
#v(6pt)

AK is very thankful to Jaehak Lee, Gibeom Noh, Changsuk Noh and Jiyong Park for pointing out the subtle mistake in Ref.~[1].

#v(6pt)
#align(center)[#line(length: 40%, stroke: 0.4pt)]
#v(14pt)

#set par(justify: true, leading: 0.5em, spacing: 0.6em)
#let refitem(n, body) = grid(columns: (1.5em, 1fr), gutter: 0.3em, [\[#n\]], body)

#refitem(1)[A. Kumar, _Multiparty quantum mutual information: An alternative definition_, Phys. Rev. A *96*, 012332 (2017).]
#refitem(2)[J. Lee, G. Noh, C. Noh and J. Park, _Comment on \"Multiparty quantum mutual information: An alternative definition\"_, Phys. Rev. A *108(6)*, 066401 (2023).]
#refitem(3)[N. J. Cerf, S. Massar, and S. Schneider, _Multipartite classical and quantum secrecy monotones_, Phys. Rev. A *66*, 042309 (2002).]
