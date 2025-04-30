% Transitions for all valid words

% eldarin
transition(q0, e, q1).
transition(q1, l, q2).
transition(q2, d, q3).
transition(q3, a, q4).
transition(q4, r, q5).
transition(q5, i, q6).
transition(q6, n, q7).

% elear
transition(q0, e, q1).
transition(q1, l, q2).
transition(q2, e, q8).
transition(q8, a, q9).
transition(q9, r, q10).

% elen
transition(q2, n, q12).

% eleni
transition(q12, i, q13).

% elenion
transition(q13, o, q14).
transition(q14, n, q15).

% elenya
transition(q12, y, q16).
transition(q16, a, q17).

% emyn
transition(q0, e, q1).
transition(q1, m, q11).
transition(q11, y, q6).
transition(q6, n, q7).

% Final states
final_state(q7).
final_state(q10).
final_state(q12).
final_state(q13).
final_state(q15).
final_state(q17).

% Entry point
recover_automaton(List) :-
    automatonCheck(List, q0).

% Accept if input ends in a final state
automatonCheck([], State) :-
    final_state(State).

% Recursive case
automatonCheck([Symbol | Rest], State) :-
    transition(State, Symbol, NextState),
    automatonCheck(Rest, NextState).
