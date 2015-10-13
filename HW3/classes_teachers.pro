%Allen Space
%Homework 3 part 2.
%Facts.
teaches(marc_sosnick, 413-1).
teaches(marc_sosnick, 413-2).
teaches(petkovic, 648-1).
teaches(petkovic, 648-2).
teaches(jozo_dujmovic, 600-1).
teaches(joze_dujmovic, 600-2).
teaches(anthony_souza, 412-1).
teaches(anthony_souza, 412-2).
teaches(anthony_souza, 210-1).
teaches(antony_souza, 210-2).
teaches(wong, 220-1).
teaches(wong, 220-2).
teaches(tomasevich, 300-1).
teaches(tomasevich, 300-2).
teaches(yang,340-1).
teaches(jozo_dujmovic,340-2).
teaches(kelly, 415-1).
teaches(wall, 510-1).

freshman(210-1).
freshman(210-2).
freshman(220-1).
freshman(220-2).
sophmore(340-1).
sophmore(300-1).
sophmore(300-2).
junior(413-1).
junior(413-2).
junior(415-1).
senior(510-1).
senior(510-2).
senior(600-1).
senior(600-2).
senior(648-1).
senior(648-2).

mwf(210-1).
mwf(210-2).
mwf(220-1).
mwf(220-2).
mwf(340-1).
mwf(600-1).
mwf(600-2).
mwf(648-1).
mwf(648-2).
tth(300-1).
tth(300-2).
tth(340-2).
tth(413-1).
tth(413-2).
tth(415-1).
tth(510-1).

%Rules.
%Teachers and that teach freshman, sophmore, junior, senior.
teaches_freshman(X) :- teaches(X,Y), freshman(Y), X \= Y, format('~w teaches freshmen with class ~w ~n',[X,Y]) .
teaches_sophmore(X) :- teaches(X,Y), sophmore(Y), X \= Y, format('~w teaches sophmore with class ~w ~n',[X,Y]).
teaches_junior(X) :- teaches(X,Y), junior(Y), X \= Y, format('~w teaches juniors with class ~w ~n',[X,Y]).
teaches_senior(X) :- teaches(X,Y), senior(Y), X \= Y, format('~w teaches senior with class ~w ~n',[X,Y]).

%Teachers that teach what parts of teh day.
teaches_morning(X) :- teaches(X,Y), morning(Y), format('~w teaches in the morning with class ~w ~n', [X,Y]).
teaches_afternoon(X) :- teaches(X,Y), afternoon(Y), format('~w teaches on afternoon with class ~w ~n', [X,Y]).
teaches_whole_day(Y) :- teaches_morning(X), teaches_afternoon(X), format('~w teaches all day with class ~w ~n', [X,Y]).

%Teachers that will teach on any given day.
works_mwf(X) :- teaches(X,Y), mwf(Y), X \= Y, format('~w teaches on M.W.F. with class ~w ~n', [X,Y]).
works_tth(X) :- teaches(X,Y), tth(Y), X \= Y, format('~w teaches on T.Th. with class ~w ~n', [X,Y]).

%Teacher that teaches three classes.
teaches_three_classes(W,X,Y,Z) :- teaches(W,X), teaches(W,Y), teaches(W,Z), X \= Y, X \= Z, Y \= Z.
