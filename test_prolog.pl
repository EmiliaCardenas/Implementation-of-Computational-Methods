?- recover_automaton([e, l, d, a, r, i, n]).
true.

?- recover_automaton([e, l, e, a, r]).
true.

?- recover_automaton([e, l, e, n]).
true.

?- recover_automaton([x, y, z]).
false.

?- recover_automaton([e, l, e, n, y, a]).
true.

?- recover_automaton([e, l, e, n, i, o, n]).
true.

?- recover_automaton([]).
false.

?- recover_automaton([e, l, e, n, i]).
true.

?- recover_automaton([e, l, 1, 2, 3, n]).
false.

?- recover_automaton([e, m, y, n]).
true.
