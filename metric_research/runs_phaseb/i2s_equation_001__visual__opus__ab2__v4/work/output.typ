#set page("us-letter", margin: 1in, numbering: "1", number-align: center)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true, leading: 0.55em)
#show math.equation: set text(font: "New Computer Modern Math")

// Title block
#align(center)[
  #v(2.2cm)
  #text(size: 17.28pt)[Equation Sample 1]
  #v(0.9em)
  #text(size: 12pt)[Dataset-expansion sample]
  #v(1.5em)
]

#set heading(numbering: "1")
#show heading: set block(above: 1.4em, below: 1em)

= Derivation

The following display is drawn from a source-backed image-to-LaTeX benchmark and reproduced verbatim.

$
upright(
alpha_3 & limits(<=)^"(i)" sum_(s in S,a in A) d^(µ^star,nu_0)(s,a,nu_0(s);rho) sqrt( (C_"clipped"^star log (N)/delta) / (N min lr(\{ d^(µ^star,nu_0)(s,a,nu_0(s);rho), 1/(S(A+B)) \})) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& <= sqrt( (C_"clipped"^star log (N)/delta) / N ) sum_(s in S,a in A) sqrt( d^(µ^star,nu_0)(s,a,nu_0(s);rho) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& quad + sqrt( (C_"clipped"^star S(A+B) log (N)/delta) / N ) sum_(s in S,a in A) sqrt(d^(µ^star,nu_0)(s,a,nu_0(s);rho)) dot sqrt( d^(µ^star,nu_0)(s,a,nu_0(s);rho) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& limits(<=)^"(ii)" sqrt( (C_"clipped"^star)/N log (N)/delta ) dot sqrt(S A) dot sqrt( sum_(s in S,a in A) d^(µ^star,nu_0)(s,a,nu_0(s);rho) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& quad + sqrt( (C_"clipped"^star S(A+B) log (N)/delta) / N ) [ sum_(s in S,a in A) d^(µ^star,nu_0)(s,a,nu_0(s);rho) ] sqrt( sum_(s in S,a in A) d^(µ^star,nu_0)(s,a,nu_0(s);rho) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& <= 2 sqrt( (C_"clipped"^star S(A+B) log (N)/delta) / N ) sqrt( sum_(s in S,a in A) d^(µ^star,nu_0)(s,a,nu_0(s);rho) "Var"_(P_(s,a,nu_0(s)))(V^(minus)) ) \
& limits(=)^"(iii)" 2 sqrt( (C_"clipped"^star S(A+B))/N log (N)/delta ) sqrt( sum_(s in S) d^(µ^star,nu_0)(s;rho) limits(bb(E))_(a tilde.op µ^star(s),b tilde.op nu_0(s)) [ "Var"_(P_(s,a,b))(V^(minus)) ] ) \
& limits(<=)^"(iv)" 2 sqrt( (C_"clipped"^star S(A+B))/N log (N)/delta ) sqrt( sum_(s in S) d^(µ^star,nu_0)(s;rho) "Var"_(P_s^(µ^star,nu_0))(V^(minus)) ).
)
$
