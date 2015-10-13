%Allen Space
%Homework 4 Part 1 family in list relationship prolog.

%Facts.
m([allen_senior, john_uncle, jim_dad, francis_uncle, allen_me, james_cousin, william_cousin, devon_cousin, david_uncle, bob]).
f([grandma, alice_grandma, karen_aunt, gladys_aunt, lizet_aunt, jacqueline_mom, breanna_cousin, erika_cousin]).

family([alice_grandma, allen_senior, [karen_aunt, john_uncle, jim_dad]]).
family([grandma, bob,[gladys_aunt, lizet_aunt, jacqueline_mom]]).
family([jacqueline_mom, jim_dad, [allen_me,[]]]).
family([karen_aunt, francis_uncle, [breanna_cousin, erika_cousin, devon_cousin]]).
family([lizet_aunt, david_uncle, [william_cousin, james_cousin]]).

%Rules
male(Element) :- m(List),  member(Element, List).
female(Element) :- f(List), member(Element, List).

father(X, C) :- male(X), family([_, X, [C|_]]).
father(X, C) :- male(X), family([_, X, [_|L]]), member(C, L).

mother(X, C) :- female(X), family([X,_, [C|_]]).
mother(X, C) :- female(X), family([X,_, [_|L]]), member(C, L).

sibling(X, Y) :- mother(Z, X), mother(Z, Y), X \= Y.
sibling(X,Y) :- father(Z, X), father(Z, Y), X \= Y.

brother(X, Y) :- male(X), sibling(X,Y),  X \= Y.
sister(X, Y) :- female(Y), sibling(X,Y), X \= Y.

uncle(X, Y) :- brother(X, Z), father(Z, Y), X \= Y.
uncle(X, Y) :- brother(X,Z), mother(Z, Y), X \= Y.

aunt(X, Y) :- sister(X, Z), father(Z, Y), X \= Y.
aunt(X, Y) :- sister(X,Z), mother(Z, Y), X \= Y.

grandfather(X,Y) :- father(X, Z), father(Z, Y), X \= Y.
grandfather(X, Y) :- father(X, Z), mother(Z, Y), X \= Y.

grandmother(X, Y) :- mother(X, Z), mother(Z, Y), X \= Y.
grandmother(X, Y) :- mother(X, Z), father(Z, Y), X \= Y.

grandparent(X,Y,Z) :- grandmother(X, Z), grandfather(Y,Z).

greatgrandfather(X,Y) :- grandfather(X,Z), father(Z,Y).
greatgrandfather(X,Y) :- grandfather(X,Z), mother(Z, Y).

greatgrandmother(X, Y) :- grandmother(X,Z), mother(Z, Y).
greatgrandmother(X, Y) :- grandmother(X,Z), mother(Z,Y).

greatgrandparent(X,Y,Z) :- greatgrandmother(X,Z), greatgrandfather(Y, Z).

ancestor(X,Y) :- father(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- father(X, Z), greatgrandfather(Z,Y).

ancestor(X,Y) :- mother(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- mother(X, Z), greatgrandfather(Z,Y). 
