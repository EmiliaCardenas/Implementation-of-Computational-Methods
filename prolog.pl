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
transition(q0, e, q10).
transition(q10, l, q11).
transition(q11, e, q12).
transition(q12, a, q13).
transition(q13, r, q14).

% elen
transition(q0, e, q20).
transition(q20, l, q21).
transition(q21, e, q22).
transition(q22, n, q23).

% eleni
transition(q23, i, q24).

% elenion
transition(q24, o, q25).
transition(q25, n, q26).

% elenya
transition(q23, y, q27).
transition(q27, a, q28).

% emyn
transition(q0, e, q30).
transition(q30, m, q31).
transition(q31, y, q32).
transition(q32, n, q7).

% Final states
final_state(q7).
final_state(q14).
final_state(q23).
final_state(q24).
final_state(q26).
final_state(q28).

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
