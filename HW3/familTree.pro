%Allen Space
%Homework 3 part 1 family tree..
%Facts..
%Genders.
is_male(allen).
is_male(jim).
is_male(john).
is_male(james).
is_male(william).
is_male(devon).
is_male(david).
is_male(francis).

is_female(jacqueline).
is_female(gladys).
is_female(karen).
is_female(lizett).
is_female(breanna).
is_female(erika).
is_female(alice).
is_female(elizabeth).


%By Parents of.
is_parent_of(jim, allen).
is_parent_of(jacqueline, allen).
is_parent_of(david, james).
is_parent_of(david, william).
is_parent_of(lizett, james).
is_parent_of(lizett, william).
is_parent_of(alice, jim).
is_parent_of(alice, john).
is_parent_of(alice, karen).
is_parent_of(alice, david).
is_parent_of(grandma, jacqueline).
is_parent_of(grandma, gladys).
is_parent_of(grandma, lizett).
is_parent_of(karen, erika).
is_parent_of(karen, breanna).
is_parent_of(karen, devon).
is_parent_of(francis, erika).
is_parent_of(francis, breanna).
is_parent_of(francis, devon).
is_parent_of(elizabeth, alice).
is_parent_of(elizabeth, grandma).

%Rules...
%Parents.
father(Father, Child) :- is_male(Father), is_parent_of(Father, Child), format('~w is the Father of ~w. ~n',[Father, Child]).
mother(Mother, Child) :- is_female(Mother), is_parent_of(Mother, Child), format('~w is the Mother of ~w ~n.',[Mother, Child]).

%Aunts, Uncles, Cousins.
uncle(X,Y) :- is_male(X), brother(X,Z), is_parent_of(Z, Y), Y \== Z, X \== Z.
aunt(X,Y) :- is_female(X), sister(X, Z), is_parent_of(Z, Y), Y \== Z, X \== Z.
cousin(X,Y) :- uncle(Z, X), father(Z, Y), format('~w is the Cousin of ~w. ~n',[Y,X]).
cousin(X, Y) :- aunt(Z, X), mother(Z, Y), format('~w is cousin of ~w.~n', [X, Y]).

%Brothers, sisters, siblings.
sibling(X, Y) :- is_parent_of(Z, X), is_parent_of(Z, Y), X \== Y, X \== Z, Y \== Z, format('~w is a sibling of ~w ~n', [X,Y]).
brother(X, Y) :- is_male(X), sibling(X,Y), X \= Y, format('~w is a brother of ~w ~n', [X,Y]).
sister(X, Y) :- is_female(X), sibling(X,Y), X \= Y, format('~w is a sister of ~w ~n', [X,Y]).

%Grandparents, ancestors.
grandparent(X, Y) :- is_parent_of(X, Z), is_parent_of(Z, Y), format('~w is the Grandchild of ~w. ~n', [X, Y]).
grandfather(X, Y) :- is_male(X), is_parent_of(X, Z), is_parent_of(Z, Y), X \== Y,  X \== Z, Y \== Z.
grandmother(X, Y) :- is_female(X), is_parent_of(X, Z), is_parent_of(Z, Y), X \== Y,  X \== Z, Y \== Z.

greatgrandparent(X, Y) :- is_parent_of(X, Z), is_parent_of(Z, Y), is_parent_of(Y, W), X \== Y,  X \== Z, Y \== Y, Y \== W, X \== W, Z \== W.
ancestor(X,Y)  :- is_parent_of(X,Y).
ancestor(X,Y) :- is_parent_of(X, Z), ancestor(Z, Y).
