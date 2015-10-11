%Allen Space
%Homework 3 part 1 family tree..
%Facts..
%Genders.
is_male(allen).
is_male(jim).
is_male(john).

is_female(jacqueline).
is_female(gladys).
is_female(karen).
is_female(lizett).


%By Parents of.
is_parent_of(jim, allen).
is_parent_of(jacqueline, allen).
is_parent_of(john, james).
is_parent_of(allen_senior, jim).
is_parent_of(alice, jim).
is_parent_of(alice, john).
is_parent_of(grandma, jacqueline).
is_parent_of(grandma, gladys).
is_parent_of(grandma, lizett).



uncle(john, allen).

%Rules...
%Parents.
father(Father, Child) :- is_male(Father), is_parent_of(Father, Child), format('~w is the Father of ~w. ~n',[Father, Child]).
mother(Mother, Child) :- is_female(Mother), is_parent_of(Mother, Child), format('~w is the Mother of ~w ~n.',[Mother, Child]).

%Aunts, Uncles, Cousins.
uncle(X,Y) :- brother(X,Z), is_parent_of(Z, Y).
aunt(X,Y) :- is_female(X), sibling(X, Z), is_parent_of(Z, X).
cousin(X,Y) :- uncle(Z, X), father(Z, Y), format('~w is the Cousin of ~w ~n',[Y,X]).

%Brothers, sisters, siblings.
sibling(X, Y) :- is_parent_of(Z, X), is_parent_of(Z, Y), X \= Y, format('~w is a sibling of ~w ~n', [X,Y]).
brother(X, Y) :- is_male(X), sibling(X,Y), X \= Y, format('~w is a brother of ~w ~n', [X,Y]).
sister(X, Y) :- is_female(X), sibling(X,Y), X \= Y, format('~w is a sister of ~w ~n', [X,Y]).

%Grandparents, ancestors.
grandparent(Grandchild, Grandparent) :- is_parent_of(Parent1, Grandchild), is_parent_of(Grandparent, Parent1), format('~w is the Grandchild of ~w. ~n', [X, Y]).
ancestor(X,Y)  :- is_parent_of(X,Y).
ancestor(X,Y) :- is_parent_of(X, Z), ancestor(Z, Y).
