#set page(
  paper: "us-letter",
  margin: (x: 1in, top: 1in, bottom: 1.15in),
)
#set text(font: ("Palatino", "Palatino Linotype", "TeX Gyre Pagella"), size: 11pt)
#set par(justify: true, leading: 1.12em, spacing: 1.25em, first-line-indent: 1.5em)
#show math.equation.where(block: true): it => block(above: 1.5em, below: 1.5em, it)

// Equation numbering handled manually
#set math.equation(numbering: none)

#let eqno(n) = h(1fr) + text[(#n)]

// ---- Title block ----
#align(center)[
  #set par(first-line-indent: 0pt, justify: false)
  #v(6pt)
  #text(size: 13pt, weight: "bold")[
    Reply to \
    Comment on ``Multiparty quantum mutual information: An alternative definition''
  ]
  #v(14pt)
  #text(size: 12pt)[Asutosh#h(0.4em)Kumar#super[1, \*]]
  #v(10pt)
  #text(size: 11pt, style: "italic")[#super[1]Department of Physics, Gaya College, Magadh University, Rampur, Gaya 823001, India]
]

#v(6pt)

#block[
  #set par(first-line-indent: 1.5em)
  We reaffirm the claim of Lee #emph[et al.] [preceding Comment, Phys. Rev. A *108*, 066401 (2023)] that the expression of quantum dual total correlation of a multipartite system in terms of quantum relative entropy as proposed in previous work [A. Kumar, Phys. Rev. A *96*, 012332 (2017)] is not correct. We provide alternate expression(s) of quantum dual total correlation in terms of quantum relative entropy. We, however, prescribe that in computing quantum dual total correlation one should use its expression in terms of von Neumann entropy.
]

#place(bottom)[
  #line(length: 32%, stroke: 0.4pt)
  #v(-6pt)
  #text(size: 9pt)[#super[\*]#h(0.3em)asutoshk.phys\@gmail.com]
]

#pagebreak()

// ---- Section I ----
#align(center)[#v(4pt) #text(weight: "bold", size: 10pt)[I.#h(1em)INTRODUCTION] #v(4pt)]

In Ref. [1] two different expressions of quantum dual total correlation were obtained: one in terms of von Neumann entropy and other in terms of quantum relative entropy. It was claimed that the two expressions are equivalent. In a comment [2] on Ref. [1], Lee #emph[et al.] have shown that the quantum dual total correlation of an $n$-partite quantum state cannot be represented as the quantum relative entropy between $(n - 1)$ copies of the quantum state and the product of $n$ different reduced quantum states for $n >= 3$. They arrived at this conclusion by considering explicitly the ``support'' condition of quantum relative entropy. Essentially, what Lee #emph[et al.] have shown is that the following two expressions are not equal for $n >= 3$:

$ I_n (rho) := sum_(k=1)^n S(rho_(overline(k))) - (n-1) S(rho), #eqno(1) $

where $rho_(overline(k)) = t r_k (rho)$ denotes the $(n-1)$-partite quantum state obtained by taking the partial trace on the $k^(t h)$ party of $rho$, and

$ J_n (rho) := S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(overline(k))), #eqno(2) $

where the quantum relative entropy is

$ S(tau || sigma) := cases(
  t r (tau log tau) - t r (tau log sigma) & "if " s u p p(tau) subset.eq s u p p(sigma),
  infinity & "otherwise."
) $

To justify their claim, authors provide two examples which imply that the above two expressions of $n$-partite quantum mutual information are not equivalent. $I_n (rho)$ in Eq. (1) is non-negative and non-increasing under local CPTP maps [3], and therefore is a suitable monotonic measure of multi-partite correlations, while $J_n (rho)$ in Eq. (2) is not.

// ---- Section II ----
#align(center)[#v(8pt) #text(weight: "bold", size: 10pt)[II.#h(1em)REAFFIRMING CLAIM OF LEE #emph[ET AL.]] #v(4pt)]

The claim of Lee #emph[et al.] is right. In this article we show analytically why the above two expressions are not equivalent. We begin with expression of $I_n (rho)$ [Eq. (1)] and proceed to show that this is not equal to $J_n (rho)$ [Eq. (2)], as argued below.

$ I_n (rho) &= sum_(k=1)^n S(rho_(overline(k))) - (n-1) S(rho) \
&= sum_(k=1)^n (S(rho_k) + S(rho_(overline(k))) - S(rho)) - (sum_(k=1)^n S(rho_k) - S(rho)) \
&= sum_(k=1)^n S(rho || rho_k ⊗ rho_(overline(k))) - S(rho || ⊗_(k=1)^n rho_k) #eqno(3) \
&= S(rho^(⊗ n) || ⊗_(k=1)^n (rho_k ⊗ rho_(overline(k)))) - S(rho || ⊗_(k=1)^n rho_k) #eqno(4) \
&attach(=, t: ?) #text(fill: blue)[$S(rho ⊗ rho^(⊗ (n-1)) || (⊗_(k=1)^n rho_k) ⊗ (⊗_(k=1)^n rho_(overline(k))))$] - S(rho || ⊗_(k=1)^n rho_k) #eqno(5) \
&= S(rho || ⊗_(k=1)^n rho_k) + S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(overline(k))) - S(rho || ⊗_(k=1)^n rho_k) \
&= S(rho^(⊗ (n-1)) || ⊗_(k=1)^n rho_(overline(k))) = J_n (rho), #eqno(6) $

where quantum relative entropy in Eq. (3) and Eq. (4) is properly matched to satisfy the ``support'' condition in the sense that

$ S(rho || ⊗_(k=1)^n rho_k) &equiv S(rho_(12 dots.c n) || ⊗_(k=1)^n rho_k) \
S(rho || rho_k ⊗ rho_(overline(k))) &equiv S(rho_(k overline(k)) || rho_k ⊗ rho_(overline(k))) \
S(rho^(⊗ n) || ⊗_(k=1)^n (rho_k ⊗ rho_(overline(k)))) &equiv S(rho_(12 dots.c n) ⊗ rho_(23 dots.c n 1) ⊗ dots.c ⊗ rho_(n 1 dots.c (n-1)) || ⊗_(k=1)^n (rho_k ⊗ rho_(overline(k)))), $

where $overline(1) = 23 dots.c n$, $overline(2) = 34 dots.c n 1$ and $overline(k) = (k+1) dots.c n 1 dots.c (k-1)$. Eq. (3) and Eq. (4) are alternate expressions equivalent to Eq. (1) in terms of quantum relative entropy. We, however, prescribe to use Eq. (1) in computing quantum dual total correlation. Eq. (5) is not correct for two reasons: (i) noncommutativity of tensor product, and (ii) ``matching'' issue of subsystems. Therefore, we cannot arrive at Eq. (6).

// ---- Section III ----
#align(center)[#v(8pt) #text(weight: "bold", size: 10pt)[III.#h(1em)SECOND REBUTTAL] #v(4pt)]

Let us reconsider Eq. (2) for $n = 3$ explicitly.

$ J_3 (rho) &= S(rho^(⊗ 2) || ⊗_(k=1)^3 rho_(overline(k))) \
&= S(rho_(123) ⊗ rho_(123) || rho_(23) ⊗ rho_(31) ⊗ rho_(12)). #eqno(7) $

Here we see that the subsystems in the first and the second arguments of the quantum relative entropy are not properly matched. However, the subsystems in the above expression could be matched up if we adopt the following conventions: (i) interpret the first argument in the usual way, with the subsystems in their standard order and (ii) interpret the tensor product in the second argument with the values of $k$ running from $n$ to 1. That is, for $n = 3$, if we define

$ tilde(J)_3 (rho) &:= S(rho^(⊗ 2) || ⊗_(k=3)^1 rho_(overline(k))) \
&= S(rho_(123) ⊗ rho_(123) || rho_(12) ⊗ rho_(31) ⊗ rho_(23)), #eqno(8) $

then we see that the subsystems are properly matched. Now, let us adopt the following notations:

$ rho_(123)^(⊗ 2) &= rho_(123) ⊗ rho_(123) equiv rho_(A_1 A_2 A_3) ⊗ rho_(B_1 B_2 B_3) equiv rho_(123) ⊗ rho_(456), #eqno(9) \
⊗_(k=3)^1 rho_(overline(k)) &= rho_(12) ⊗ rho_(31) ⊗ rho_(23) equiv rho_(A_1 A_2) ⊗ rho_(A_3 B_1) ⊗ rho_(B_2 B_3) equiv rho_(12) ⊗ rho_(34) ⊗ rho_(56). #eqno(10) $

Then, using notations in Eqs. (9, 10), one might attempt to show that Eq. (8) is equivalent to $I_3 (rho) = sum_(k=1)^3 S(rho_(overline(k))) - 2 S(rho)$ as argued below.

$ tilde(J)_3 (rho) &:= S(rho^(⊗ 2) || ⊗_(k=3)^1 rho_(overline(k))) \
&= S(rho_(123) ⊗ rho_(123) || rho_(12) ⊗ rho_(31) ⊗ rho_(23)) \
&equiv S(rho_(123) ⊗ rho_(456) || rho_(12) ⊗ rho_(34) ⊗ rho_(56)) \
&= - t r (rho_(123) ⊗ rho_(456) log (rho_(12) ⊗ rho_(34) ⊗ rho_(56))) + t r (rho_(123) ⊗ rho_(456) log (rho_(123) ⊗ rho_(456))) \
&= - t r (rho_(123) ⊗ rho_(456) log (rho_(12) ⊗ I_(34) ⊗ I_(56))) - t r (rho_(123) ⊗ rho_(456) log (I_(12) ⊗ rho_(34) ⊗ I_(56))) \
&#h(0em) - t r (rho_(123) ⊗ rho_(456) log (I_(12) ⊗ I_(34) ⊗ rho_(56))) + t r (rho_(123) ⊗ rho_(456) log (rho_(123) ⊗ I_(456))) + t r (rho_(123) ⊗ rho_(456) log (I_(123) ⊗ rho_(456))) \
&= - t r_(12) (rho_(12) log rho_(12)) #text(fill: blue)[$- t r_(34) (rho_3 ⊗ rho_4 log rho_(34))$] - t r_(56) (rho_(56) log rho_(56)) + t r_(123) (rho_(123) log rho_(123)) + t r_(456) (rho_(456) log rho_(456)) \
&attach(=, t: ?) S(rho_(12)) + #text(fill: blue)[$S(rho_(34))$] + S(rho_(56)) - S(rho_(123)) - S(rho_(456)) #eqno(11) \
&equiv S(rho_(12)) + S(rho_(31)) + S(rho_(23)) - 2 S(rho_(123)) = I_3 (rho). #eqno(12) $

But this is not correct because the second term in Eq. (11) cannot be obtained from the previous equation.

Thus, even if we define quantum dual total correlation of a multipartite system in terms of quantum relative entropy alternatively as

$ tilde(J)_n (rho) := S(rho_(12 dots.c n)^(⊗ (n-1)) || ⊗_(k=n)^1 rho_(overline(k))), #eqno(13) $

and use the notations as discussed above, Eq. (13) is not equivalent to Eq. (1).

// ---- Acknowledgments ----
#pagebreak()
#align(center)[#v(4pt) #text(weight: "bold", size: 10pt)[ACKNOWLEDGMENTS] #v(4pt)]

AK is very thankful to Jaehak Lee, Gibeom Noh, Changsuk Noh and Jiyong Park for pointing out the subtle mistake in Ref. [1].

#align(center)[#v(6pt) #line(length: 40%, stroke: 0.4pt) #v(6pt)]

#set par(first-line-indent: 0pt)
#let refitem(n, body) = grid(columns: (1.4em, 1fr), gutter: 0pt, [[#n]], body)

#refitem(1)[A. Kumar, #emph[Multiparty quantum mutual information: An alternative definition], Phys. Rev. A *96*, 012332 (2017).]
#v(2pt)
#refitem(2)[J. Lee, G. Noh, C. Noh and J. Park, #emph[Comment on ``Multiparty quantum mutual information: An alternative definition''], Phys. Rev. A *108(6)*, 066401 (2023).]
#v(2pt)
#refitem(3)[N. J. Cerf, S. Massar, and S. Schneider, #emph[Multipartite classical and quantum secrecy monotones], Phys. Rev. A *66*, 042309 (2002).]
