
is_male(allen).
is_male(jim).
is_male(john).

is_female(jacqueline).
is_female(gladys).

is_parent_of(jim, allen).
is_parent_of(jacqueline, allen).
is_parent_of(john, james).
is_parent_of(allen_senior, jim).
is_parent_of(alice, jacqueline).

brother(john, jim).
sister(jacqueline, gladys).


uncle(john, allen).


father(Father, Child) :- is_male(Father), is_parent_of(Father, Child), format('~w is the Father of ~w. ~n',[Father, Child]).
mother(Mother, Child) :- is_female(Mother), is_parent_of(Mother, Child), format('~w is the Mother of ~w ~n.',[Mother, Child]).
uncle(X,Y) :- brother(X,Z), is_parent_of(Z, Y).
aunt(X,Y) :- sister(X,Z), is_parent_of(Z, Y).
cousin(X,Y) :- uncle(Z, X), father(Z, Y), format('~w is the Cousin of ~w ~n',[Y,X]).
grandparent(Grandchild, Grandparent) :- is_parent_of(Parent1, Grandchild), is_parent_of(Grandparent, Parent1), format('~w is the Grandchild of ~w. ~n', [X, Y]).

ancestor(X,Y)  :- is_parent_of(X,Y).
ancestor(X,Y) :- is_parent_of(X, Z), ancestor(Z, Y).
