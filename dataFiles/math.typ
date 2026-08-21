= Introduction
<introduction>
Sometimes, the most fun problems to work on are the ones easiest to
visualize. Especially in geometry, problems like this are everywhere.
The simplest ideas can generate non-trivial problems, with beautiful
solutions. \ Thinking about random point arrangements (the basis of
incidence geometry; that is, the geometry that deals with sets of points
and lines through points), one stumbles upon a problem that is easy
enough to come up with: the following problem, presented by James Joseph
Sylvester in 1893.

#block[
Prove that it is not possible to arrange any finite number of real
points so that a straight line through every two of them shall pass
through a third, unless they all lie in the same straight line. \ \ Or
rephrased, in every arrangement of a finite number of real points on the
Euclidean plane (which is just the familiar flat, infinite,
two-dimensional surface of standard high-school geometry), there is a
straight line passing through only two of these points, unless all
points are collinear.

]
To get an initial hold of this problem, imagine some points, all in the
same line. We know there is some unique line passing through all of
them. Now, we displace one of these points slightly. \

We can see that some line has been generated that passes through only
two of the points: the displaced point, and the adjacent point to it.
The idea of the problem is to show such a line, passing through
#strong[exactly two points], exists in all possible arrangements of
finite points. \ On first instinct, proof by contradiction seems to be
the way to go. And it was, for Kelly, although this proof was pretty
pervasive, and went undiscovered for decades, it is a really short and
simple one. \

#strong[We shall go through two proofs of the problem statement]. One
given by #strong[Eberhard Melchior], in 1941, after Paul Erdős
popularised the problem; and the other much later, in 1986, by
#strong[Leroy Milton Kelly]. The former proof is a much more general
one, made using concepts of graph theory, and projective plane geometry
(I will try my best to explain this, to the extent at which I am able to
grasp it myself), and the latter is a much simpler and more elegant one,
although not being nearly as useful in application to other spheres or
problems as Melchior's. \ \ \ \ \ \ We list 2 standard definitions for
our proofs:

#block[
Let $P = { n_1\,n_2\,n_3 dots.h }\,n gt.eq 3$ be a set of not all
collinear points in the euclidean plane. A line that contains two or
more points of P is called a connecting line and is #strong[ordinary],
if it contains exactly two points.

]
#block[
If a line passes through $n$ points on the plane P, it is called
#strong[$n$-rich].

]
We restate #strong[Problem 1] as the following theorem, then proceed to
prove it.

#block[
#strong[\(Sylvester-Gallai Theorem)] Every such set P determines at
least one ordinary line.

]
\ Let us first look at Kelly's proof, a truly beautiful and simple one,
with elementary geometrical construction, proving the theorem by
contradiction.

= Kelly's Proof
<kellys-proof>
#block[
#emph[Proof.] Let $l$ be a line in the plane, such that it passes
through $n$ points in the plane, and there exists some point $P$ in the
plane, whose perpendicular distance to $l$ is the minimal perpendicular
distance between any point-line pair in the plane. Note that since we
have an arrangement of a finite number of points (in the set P) in our
plane, the set of lines determined by the points in P is also finite. \

Now we draw a perpendicular $P P'$ onto $l$. There must exist at least
one point on either side of $P$, on $l$. We have two cases:

+ $l$ is ordinary.

+ $l$ is not ordinary, it is $n$-rich for some $n > 2 .$

We assume Case 2 to be true. Then, there must be more than one point on
the left or right of $P'$. Let us say there are two points $B$ and $C$
to the right of $P'$, such that $B$ is the first point on the right of
$P'$, and $C$ is some other point. \

Now, we draw a line $m$, through $P C$. We draw a perpendicular from $B$
onto $m$. Observe that this perpendicular $B B'$, will have a shorter
length than $P P'$. \ Then we have found a point-pair, namely $B$ and
$m$, such that the perpendicular distance is even lesser than $P P'$. \

But, this contradicts our choice of $l$ and $P$ as the closest
point-line pair.

Hence, Case-1 must be true, and $l$ is proved to be ordinary.~◻

]
\ On first read, this proof felt extremely satisfying to me, like it was
out of Erdős' "#strong[Book]". But in a way, this proof is "a bit too
clever". There isn't much of anything we can extend this to. \ For the
purpose of extension, and to find some results we can apply to other
areas of Mathematics, we turn now, to #strong[Melchior's proof].

= Melchior's Proof
<melchiors-proof>
In this proof, the concepts of the #strong[Projective Plane] and
#strong[Graph Theory] have been used. We will go through the specific
results/concepts we need.

== Projective Plane
<projective-plane>
#block[
A #strong[projective plane] $pi$ is a triple $\(bb(P)\,bb(L)\,bb(I)\)$
such that $bb(P)$ is a set of points, $bb(L)$ is a set of lines and
$bb(I)$ is an incidence relation generated by the following binding
axioms:

+ $exists$ a unique line in the set $bb(L)$ joining any 2 distinct
  points from the set $bb(P)$.

+ $exists$ a unique point of intersection of any 2 distinct lines from
  the set $bb(L)$.

+ $exists$ $gt.eq 3$ non-collinear points in the set $bb(P)$.

+ $exists$ $gt.eq$ 3 points on each line in the set $bb(L)$.

]
The modification made to our "normal" notions of geometry here, is that
#strong[all] lines intersect. More precisely, all parallel lines now
intersect at #strong[one, distinct point] which is placed "at infinity"
and on the #strong[line at infinity].

#block[
A #strong[affine plane] is a triple $\(bb(P)\,bb(L)\,bb(I)\)$ such that
$bb(P)$ is a set of points, $bb(L)$ is a set of lines and $bb(I)$ is an
incidence relation generated by the following binding axioms:

+ Every pair of points in the set $bb(P)$ lies on a unique line in the
  set $bb(L)$

+ Given any line $l in bb(L)$ and any point $P in bb(P)$ which doesn't
  lie on $l$, $exists$ a unique line $m in bb(L)$ such that P lies on
  $m$ and $l sect m = nothing$ (no point lies on both $l$ and $m$).

+ $exists$ $3$ non-collinear points in the set $bb(P)$.

]
The affine plane represents pretty much what our "normal" notion of
geometry is. The euclidean plane, which we are most used to, is an
example of an affine plane.

#block[
A #strong[pencil] of parallel lines is the set of all lines which are
parallel, in the affine plane.

]
#block[
Let $pi =\(bb(P)\,bb(L)\,bb(I)\)$ be a projective plane. \ Removing any
line $l_oo$ of $pi$ as well as all points on it, forms a new triple
$pi^(l_oo)$, such that $pi^(l_oo)$ is an affine plane.

]
#block[
#emph[Proof.] We verify the 3 points in Definition 4. \ #strong[\1.] Let
$P\,Q$ be two distinct points, not on $l_oo$. Then, there is a unique
line $m$ through them in $bb(L)$, by the definition of a projective
plane. Hence, $m$ is a line in $bb(L) - { l_oo }$ passing through $P$
and $Q$. \

#strong[\2.] Let $m in bb(L) - { l_oo }$ and $P in bb(P)$ be a point not
on $m$. Then, in the projective plane $pi$, there is a unique line
passing through $P$ and $I = m sect l_oo$. Then, clearly $n eq.not m$
and $n$ only intersects $m$ at $I$ in $pi$, so that in the new plane,
$n$ and $m$ are parallel. The uniqueness of $n$ follows from the fact
that the line passing through $P$ and $I$ in $pi$ is unique. \

#strong[\3.] Follows directly from the definition of a projective
plane.~◻

]
#block[
#strong[\(Theorem of Duality)] If $bb(T)$ is a valid theorem in the
projective plane, and $bb(T)'$ is a new statement obtained from $bb(T)$,
by making the following changes:

+ "point" $arrow.l.r$ "line"

+ "collinear" $arrow.l.r$ "concurrent"

+ "join" $arrow.l.r$ "intersection"

Then, $bb(T)'$ holds for the projective plane.

]
The proof for Theorem 3.1 is omitted here, but it is quite easy to see
why it works with an example, as given below. \

We consider the Theorem of Pappus as an example.

#block[
#strong[\(Pappus' Theorem)] Let $l\,l'$ be two lines in the plane. Let

+ $A\,B\,C$ be points of $l$.

+ $A'\,B'\,C'$ be points of $l'$.

+ all these points be distinct from $l sect l'\,$

Then, $L = A B' sect A' B\,M = A C' sect A' C\,N = B C' sect B' C$ are
collinear. \ \ #strong[\(Dual Version of the Theorem)] Let $P\,P'$ be
two points in the plane. Let

+ $a\,b\,c$ be lines concurrent at P.

+ $a'\,b'\,c'$ be lines concurrent at P'.

+ all these lines be distinct from that joining $P\,P' .$

Then, $l$ joining $\(a sect b'\)$ and $\(b sect a'\)$, $n$ joining
$\(a sect c'\)$ and $\(c sect a'\)$, $m$ joining $\(c sect b'\)$ and
$\(b sect c'\)$ are concurrent at some point $Q$.

]
Below are the standard, and dual versions of the theorem in a
diagrammatic form.

== Some concepts of Graph Theory
<some-concepts-of-graph-theory>
#block[
A #strong[graph] is defined as an object consisting of 2 sets: $V_G$, a
set of vertices and $V_E$, a set of edges, which are 2 point sets. \ For
example, a graph G can be written as {{P,Q,R,S,T},{{P,Q},{R,S},{Q,T}}}.

]
#block[
The #strong[degree] of a vertex is equal to the number of edges
connecting at that vertex.

]
#block[
The #strong[Euler Characteristic $chi$] is defined for graphs, by the
formula $chi = V - E + F$, where $V$ is the number of vertices, $E$ is
the number of edges and $F$ is the number of connected regions
(including unbounded regions).

]
#strong[We take it as a fact that for projective planes,
$upright(bold(chi = 1 .))$] The rigorous proof for this is quite
convoluted, but we can accept the intuition that for planar graphs, it
is easy to prove that $chi = 2$ and in the projective plane, the line at
infinity acts like an "extra edge". \ Proofs of this fact use algebraic
topology and are out of the scope of this article. #strong[#strong[]]

== Proceeding with the proof
<proceeding-with-the-proof>
Now we can finally attempt to understand Melchior's proof, with the
knowledge of preceding subsections. \

#block[
#emph[Proof.] Let P be a finite set of points in a projective plane
$pi =\(P\,L\,I\)$. Let us consider a #strong[dual collection] of $n$
lines:

#block[
$P^(*) = { p^(*) : p in P }$.

]
We know from that (for the projective plane) $ V - E + F = 1 . $ Now, by
duality, we can write $ V = sum_(k = 2)^n N_k\, $ where $N_k$ is the
number of lines passing through only k vertices. (By duality, this sums
up all vertices of degree 2, then of degree 3, and so on till degree
$n$, which spans all vertices.) \ Also, the degree of a vertex
$l^(*)\,d\(l^(*)\)$ is twice the number of lines passing through it,
since a line through a point consists two edges for that point. This
degree (by duality) can be written as $upright(bold(2\|P sect l\|))$,
which is equal to twice the number of points of $P$ on any line in the
arrangement. \ Summing over all lines $l$:
$ 2 E = sum_l d\(l^(*)\)= 2 sum_l\|P sect l\|= 2 sum_(k = 2)^n k N_k $
Let $M_s$ be the number of faces with $s$ edges. Since every face is
bounded by at least 3 edges, and each edge is incident to 2 faces, we
can write $ 2 E = sum_(s = 3)^n s M_s . $ Combining equations 1,2,3 and
4, we can find our required result. $ 3 V & = 3 + 3 E - 3 F\
upright("or, ") 3 sum_(k = 2)^n N_k & = 3 +\(sum_(k = 2)^n k N_k + sum_(s = 3)^n s M_s\)- 3 sum_(s = 3)^n M_s\
upright("or, ") 0 & = 3 + sum_(k = 2)^n\(k - 3\)N_k + sum_(s = 3)^n\(s - 3\)M_s\
upright("or, ") 0 & = 3 - N_2 + sum_(k = 4)^n\(k - 3\)N_k + sum_(s = 4)^n\(s - 3\)M_s\
upright("or, ") N_2 & = 3 + sum_(k = 4)^n\(k - 3\)N_k + sum_(s = 4)^n\(s - 3\)M_s\
 $ which implies the Sylvester-Gallai Theorem.~◻

]
Surprisingly enough, this proof not only shows that one ordinary line
shall exist, but rather that #strong[three must exist], for any finite
arrangement.

This proof gives us a "better" result, although it is way more
convoluted than what Kelly came up with. It is quite stunning how
elusive the prior proof was. It took decades after Melchior's
publication, for someone to revisit the problem, after Paul Erdos
brought it back up, so this elegant and beautiful proof could be
presented to the world. \

The most satisfying mathematics is not always the most applicable, or
"the best". Beauty, in many cases, arises from simplicity.
