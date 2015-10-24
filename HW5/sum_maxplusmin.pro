%Allen Space
%Homework 5, find the min and mx in a list and add together.
%Question Part A.

sum(List, MinPlusMax) :- min_list(List, X), max_list(List, Y), MinPlusMax is (X + Y).
