%Allen Space
%Homework 4 Part 1 family in list relationship prolog.

%Facts.
m([allen_senior, john_uncle, jim_dad, francis_uncle, allen_me, james_cousin, william_cousin, devon_cousin, david_uncle, bob, timothy]).
f([grandma, alice_grandma, karen_aunt, gladys_aunt, lizet_aunt, jacqueline_mom, breanna_cousin, erika_cousin, elizabeth]).

family([alice_grandma, allen_senior, [karen_aunt, john_uncle, jim_dad]]).
family([grandma, bob, [gladys_aunt, lizet_aunt, jacqueline_mom]]).
family([jacqueline_mom, jim_dad, [allen_me]]).
family([karen_aunt, francis_uncle, [breanna_cousin, erika_cousin, devon_cousin]]).
family([lizet_aunt, david_uncle, [william_cousin, james_cousin]]).
family([elizabeth, timothy, [alice_grandma]]).

%Rules
male(Element) :- m(List),  member(Element, List).
female(Element) :- f(List), member(Element, List).

father(X, C) :- male(X), family([_, X, [C|_]]).
father(X, C) :- male(X), family([_, X, [_|L]]), member(C, L).

mother(X, C) :- female(X), family([X,_, [C|_]]).
mother(X, C) :- female(X), family([X,_, [_|L]]), member(C, L).

parent_of(P, C) :- father(P, C), P \= C.
parent_of(P, C) :- mother(P, C), P \= C.

sibling1(X, Y) :- parent_of(Parent1, X), parent_of(Parent1, Y), parent_of(Parent2, X), parent_of(Parent3, Y),
                  X \= Y, Parent1 \= Parent2, Parent1 \= Parent3.

sibling2(X, Y) :- parent_of(Parent1, X), parent_of(Parent1, Y), parent_of(Parent2, X), parent_of(Parent2, Y),
                                    X \= Y.


brother1(X, Y) :- male(X), sibling1(X,Y),  X \= Y.
brother2(X, Y) :- male(X), sibling2(X,Y), X \= Y.

sister1(X, Y) :- female(X), sibling1(X,Y), X \= Y.
sister2(X,Y) :- female(X), sibling2(X,Y), X \= Y.

uncle1(X, Y) :- male(X), brother1(X, Z), parent_of(Z,Y), X \= Y, format('~w is the uncle of ~w. ~n', [X,Y]).
uncle2(X, Y) :- male(X), brother2(X,Z), parent_of(Z,Y), X \= Y, format('~w is the uncle of ~w. ~n', [X,Y]).

aunt1(X, Y) :- female(X), sister1(X, Z), parent_of(Z,Y), X \= Y, format('~w is the aunt of ~w. ~n', [X,Y]).
aunt2(X, Y) :- female(X), sister2(X,Z), parent_of(Z,Y), X \= Y, format('~w is the aunt of ~w. ~n', [X,Y]).

grandfather(X,Y) :- father(X, Z), father(Z, Y), X \= Y.
grandfather(X, Y) :- father(X, Z), mother(Z, Y), X \= Y.

grandmother(X, Y) :- mother(X, Z), mother(Z, Y), X \= Y.
grandmother(X, Y) :- mother(X, Z), father(Z, Y), X \= Y.

grandparent(X,Y,Z) :- grandmother(X, Z), grandfather(Y,Z).

greatgrandfather(X,Y) :- grandfather(X,Z), father(Z,Y).
greatgrandfather(X,Y) :- grandfather(X,Z), mother(Z, Y).

greatgrandmother(X, Y) :- grandmother(X,Z), father(Z, Y).
greatgrandmother(X, Y) :- grandmother(X,Z), mother(Z,Y).

greatgrandparent(X,Y,Z) :- greatgrandmother(X,Z), greatgrandfather(Y, Z).

ancestor(X,Y) :- father(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- father(X, Z), greatgrandfather(Z,Y).

ancestor(X,Y) :- mother(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- mother(X, Z), greatgrandfather(Z,Y).
