%Allen Space
%Homework 4 part 3 Queens 8 prolog.

%Facts.
%Elements = [1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_].
%Rules.
answer([]) :- write('END OF Operation'), nl.
answer([X/Y|Others]) :- answer(Others), member(Y, [1,2,3,4,5,6,7,8]), no_hit(X/Y, Others).

no_hit(_,[]).
no_hit(X/Y, [X1/Y1|Others]) :- Y =\= Y1, Y1 - Y =\= X1 - X, Y1 - Y =\= X - X1, no_hit(X/Y, Others).

print_queens(List, N) :- forall(member(X, List), format('~w ', [X])).

show_result(X) :- template(List), findall(List, answer(List), LS), length(LS,N), X is N, format('for 8 queens there are ~w. ~n', [X]), print_queens(LS, X).

template([1/_, 2/_, 3/_, 4/_, 5/_, 6/_, 7/_, 8/_]).
