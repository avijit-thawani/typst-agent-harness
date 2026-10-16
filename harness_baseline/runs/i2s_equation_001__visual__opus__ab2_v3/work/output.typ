#let margin = sys.inputs.at("margin", default: "1in")
#let fontsize = sys.inputs.at("fontsize", default: "11pt")

#set page(paper: "us-letter", margin: eval(margin))
#set text(font: "New Computer Modern", size: eval(fontsize))
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1")

// title block (\maketitle)
#align(center)[
  #v(1.7cm)
  #text(size: 1.6em)[Equation Sample 1]
  #v(0.6em)
  #text(size: 1.05em)[Dataset-expansion sample]
  #v(1.2em)
]

#let dmn = $d^(mu^star\,nu_0)$
#let Cc = $C_(sans("clipped"))^star$
#let Vpe = $V_(sans("pe"))^(-)$
#let logNd = $log N/delta$
#let sa = $s in cal(S)\,a in cal(A)$

= Derivation

The following display is drawn from a source-backed image-to-LaTeX benchmark and reproduced verbatim.

#v(0.6em)

#[
#set par(leading: 0.8em)
$
alpha_3 & limits(<=)^"(i)" sum_(#sa) dmn (s\,a\,nu_0(s);rho) sqrt(frac(Cc log N/delta, N min lr({ dmn (s\,a\,nu_0(s);rho)\, frac(1,S(A+B)) })) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& <= sqrt(frac(Cc log N/delta, N)) sum_(#sa) sqrt(dmn (s\,a\,nu_0(s);rho) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& quad + sqrt(frac(Cc S(A+B) log N/delta, N)) sum_(#sa) sqrt(dmn (s\,a\,nu_0(s);rho)) dot sqrt(dmn (s\,a\,nu_0(s);rho) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& limits(<=)^"(ii)" sqrt(frac(Cc, N) log N/delta) dot sqrt(S A) dot sqrt(sum_(#sa) dmn (s\,a\,nu_0(s);rho) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& quad + sqrt(frac(Cc S(A+B) log N/delta, N)) lr([ sum_(#sa) dmn (s\,a\,nu_0(s);rho) ]) sqrt(sum_(#sa) dmn (s\,a\,nu_0(s);rho) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& <= 2 sqrt(frac(Cc S(A+B) log N/delta, N)) sqrt(sum_(#sa) dmn (s\,a\,nu_0(s);rho) sans("Var")_(P_(s\,a\,nu_0(s)))(Vpe)) \

& limits(=)^"(iii)" 2 sqrt(frac(Cc S(A+B), N) log N/delta) sqrt(sum_(s in cal(S)) dmn (s;rho) limits(bb(E))_(a tilde mu^star(s)\,b tilde nu_0(s)) [sans("Var")_(P_(s\,a\,b))(Vpe)]) \

& limits(<=)^"(iv)" 2 sqrt(frac(Cc S(A+B), N) log N/delta) sqrt(sum_(s in cal(S)) dmn (s;rho) sans("Var")_(P_s^(mu^star\,nu_0))(Vpe)) .
$
]
