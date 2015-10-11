
teaches(marc_sosnick, 413-1).
teaches(marc_sosnick, 413-2).
teaches(marc_sosnick, 648-1).
teaches(marc_sosnick, 648-2).
teaches(jozo_duj, 600-1).
teaches(joze_duj, 600-2).

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
junior(415-2).
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
mwf(300-1).
mwf(300-2).
mwf(340-1).
mwf(510-1).
mwf(510-2).
mwf(600-1).
mwf(600-2).
mwf(648-1).
mwf(648-2).
tth(413-1).
tth(413-2).
tth(415-1).
tth(415-2).


%Teachers and that teach freshman, sophmore, junior, senior.
teaches_freshman(X) :- teaches(X,Y), freshman(Y).
teaches_sophmore(X) :- teaches(X,Y), sophmore(Y).
teaches_junior(X) :- teaches(X,Y), junior(Y).
teaches_senior(X) :- teaches(X,Y), senior(Y).

%Teachers that teach what parts of teh day.
teaches_morning(X) :- teaches(X,Y), morning(Y).
teaches_afternoon(X) :- teaches(X,Y), afternoon(Y).
teaches_whole_day(Y) :- teaches_morning(X), teaches_afternoon(X).

%Teachers that will teach on any given day.
works_mwf(X) :- teaches(X,Y), mwf(Y), X \= Y.
works_tth(X) :- teaches(X,Y), tth(Y), X \= Y.

%Teacher that teaches three classes.
teaches_three_classes(W,X,Y,Z) :- teaches(W,X), teaches(W,Y), teaches(W,Z), X \= Y, X \= Z, Y \= Z.
