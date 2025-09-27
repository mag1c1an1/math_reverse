
= Propositions

Definition. A proposition is a statement that can be either true or false.

English language is riddled with ambiguities.

Without knowing these definitions, you might sometimes get the gist of statements in this language, but you would regularly get misled about what they really meant.

== Compund Propositions

=== NOT, AND, and OR

We can precisely define these special words using truth tables.
For example, if P denotes ans arbitrary proposition, then the truth of the prposition
"NOT(P)" is defined by the following truth table:

#table(
  columns: (1fr, 1fr),
  align: horizon,
  table.header([P], [NOT(P)]),
  "T", "F",
  "F", "T",
)

"P OR Q":

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P OR Q]),
  "T", "T", "T",
  "T", "F", "T",
  "F", "T", "T",
  "F", "F", "F",
)


If a mathematician says, "You may have cake, or you may have ice cream,"
he means that you could have both.

If you want to exclued the possibility of both having and eating, you should
use "exclusive-or"(XOR):

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P XOR Q]),
  "T", "T", "F",
  "T", "F", "T",
  "F", "T", "T",
  "F", "F", "F",
)

=== IMPLIES

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P IMPLIES Q]),
  "T", "T", "T",
  "T", "F", "F",
  "F", "T", "T",
  "F", "F", "T",
)

The truth table for implications can be summerized as follows:

_An implication is true exactly when the if-part is false or the then-part is true._

=== IFF

The proposition "P if and only if Q" asserts that P and Q are logically equivalent;
that is, either both are true or both are false.

#table(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P IFF Q]),
  "T", "T", "T",
  "T", "F", "F",
  "F", "T", "F",
  "F", "F", "T",
)

=== Notation

#table(
  columns: (1fr, 1fr),
  align: horizon,
  table.header([English], [Mathematical]),
  "NOT P", $ not P ("alternatively," overline(P)) $,
  "P AND Q", $ P and Q $,
  "P OR Q", $ P or Q $,
  "P IMPLIES Q", $ P arrow.r Q $,
  "P IFF Q", $ P arrow.l.r Q $,
)

=== Logically Equivalent Implications


#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P IMPLIES Q], [NOT(Q) IMPLIES NOT(P)]),
  "T", "T", "T", "T",
  "T", "F", "F", "F",
  "F", "T", "T", "T",
  "F", "F", "T", "T",
)

In gernal, "NOT(Q) IMPLIES NOT(P)" is called the *contrapositive* of the implication
"P IMPLIES Q". And, as we've just shown, the two are just different ways of saying the same thing.

Converse is :

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P IMPLIES Q], [Q IMPLIES P]),
  "T", "T", "T", "T",
  "T", "F", "F", "T",
  "F", "T", "T", "F",
  "F", "F", "T", "T",
)

An implication is logically equivalent to its contrapositive, but is not equivalent to its converse.

An implication and its converse together are equivalent to
an if statement. For example,

IF I am grumpy, then I am hungry. AND if I am hungry, then I am grumpy.

are equivalent to the single statement:

I am grumpy IFF I am hungry.

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: horizon,
  table.header([P], [Q], [P IMPLIES Q], [Q IMPLIES P], [(P IMPLIES Q) and (Q IMPLIES P)], [P IFF Q]),
  "T", "T", "T", "T", "T", "T",
  "T", "F", "F", "T", "F", "F",
  "F", "T", "T", "F", "F", "F",
  "F", "F", "T", "T", "T", "T",
)

= Propositions Logic in Computer Programs

A chip with fewer devices is smaller, consumes less power,
has a lower defect rate, and is cheaper to manufacture.

= Predicates and Quantifiers

=== Propositions with Infinitely Many Cases

You can't check a claim about an infinite set by checking a finite set of its elements, 
no matter how large the finite set.

$ forall a,b,c,d in bb(Z^+). a^4 + b^4 + c^4 != d^4 $

Of course, you may be wondering why anyone would care whether or not 
there is a solution to $313(x^3+y^3)=z^3$ where x,y and z are positive integers.
It turns out that finding solutions to such equations is important in the field 
of _elliptic curves_, which turns out to be important to the study of factoring 
large integers, which turns out to be important in cracking commonly-used cryptosystems, 
which is why mathematicians went to the effort to find the solution with thousands of digits.

=== Predicates

A predicate is a proposition whose truth depends on the value of one or more vari-
ables.

=== Quantifiers

An assertion that a predicate is always true, is called a _universally quantified statement_.

An assertion that a predicate is sometimes true, is called an _existentially quantified statement_.

=== More Notation

$ forall, exists $

=== Mixing Quantifiers

$ forall n in "Evens". exists p,q in "Primes". p + q = n $

=== Order of Quantifiers
 
Swapping the order of different kinds of quantifiers (existential and universal) usually 
changes the meaning of a proposition.

=== Variables Over One Domain

When all the variables in a formula are understood to take values from the same
nonempty set,D,it's conventional to omit mention of D.

=== Negating Quantifiers

In terms of logical notation, this follows from a general property of predicate formulas:

$ "NOT"(forall x. P(x)) "is equivalent to" exists x. "NOT"(P(x)). $

The general principle is that _moving a "not" across a quantifier changes the kind of quantifier_.

= Validity

#set math.equation(numbering: "(1)" )

A propositional formula is called valid when it evaluates to *T* no matter what truth
values are assigned to the individual propositional variables. 

$ exists x forall y. P(x,y) "IMPLIES" forall y exists x. P(x,y) $

The formula

$ forall y exists x. P(x,y) "IMPLIES" exists x forall y. P(x,y) $ is not valid.

_counter model_

= Satisfiability
A proposition is *satisfiable* if some setting of the variables makes the proposition
true. 
The general problem of deciding whether a proposition is satisfiable is called
SAT.