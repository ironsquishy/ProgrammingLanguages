
%Allen Space
%Homework 4 part 2 prolog list operations.

%Facts..
my_list([1,2,3,4,5,6,7,4,12,24,6,7,100]).

%Rules..
is_an_element(Element, List) :-  member(Element, List).
is_an_element(Element) :- my_list(List), member(Element, List).

%Getting first and second element.
get_first_element(X) :- my_list(List), nth0(0, List, X).
get_first_element(X, List) :- nth0(0, List, X).

last_element(X,[X]).
last_element(X, [_|List]) :- last_element(X,List).

%Adjacents Two and Three.
adjacent(X, Y, [X,Y|_]).
adjacent(X, Y, [_|T]) :- adjacent(X, Y, T).

adjacent(X, Y, Z, [X,Y,Z|_]).
adjacent(X,Y, Z, [_|T]) :- adjacent(X, Y, Z, T).

append_two_lists(List1, List2, List3) :- append(List1, List2, List3).

delete_from_list_element(X, [X|Tail], Tail).
delete_from_list_element(X, [H|T], [H|T1]) :- delete_from_list_element(X, T, T1).

append_to_list(List, Element) :- append(List, [Element], X), format('new element added-> ~w. ~n', [X]).

insert_element(X, L, XL) :- delete_from_list_element(X, XL, L), format('~w is now the list ~w. ~n', [X, L]).

length_of(List) :- length(List, X), format('~w is length ~w. ~n', [List, X]).

reverse_list(List1) :- reverse(List1, List2), format('~w -> now in reverse order ~w. ~n',[List1, List2]).

palindrome(List1) :- reverse(List1, List2), compare(=, List2, List1).

display_list([]).
display_list([H|T]) :- write(H), nl, display_list(T).
