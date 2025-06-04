# Implementation-of-Computational-Methods
## Corrections
- Adding the prolog code and its cases
- Change some parts of the explanation of Prolog and its Analysis

## Description
During this Evidence, I have been using the language “Quenya,” which is an elvish language that is part of the branch ‘Aman.’ Quenya was typically written with the Tengwar of Fëanor, a writing structure that nowadays resembles Arabic or Hindi traces in their words. There is information about two different dialects coming for Quenya, which are Valinorean Quenya and Vanyarin Quenya; spoken by two different clans of the Aman, the Noldor and the Vanyar. It has a Latin-like phonology, also having the same 5 vowels that we have in most Latin languages nowadays. Even though it can give an idea of most Romance languages, it is more influenced by Finnish; some of the language rules are presented in the Elvish structure. The word Quenya means “belonging to the Quendi”; however, the meaning does not delimit the language to just be spoken in certain places.  (Lambenor, n.d.)

The objective is to create a program that only recognizes the words that have been assigned to me in Quenya. The words are:
Eldarin
Elear
Elen
Eleni
Elenion
Elenya
Emyn

For the automata, I have been using a DFA (Deterministic Finite Automata), which is more rigid because it only transitions to one state, only one. It doesn't allow any null transitions; all of the transitions must be defined. Used this one to have a more exact model and avoid having something confusing. (GeeksforGeeks, n.d.)

## Model of Solution
The automata generated ended up being this one:

![DFA](Automata.png)

It takes all the different routes that the letters of the words can be. It is built that way, so other words with extra letters or in a different order are not accepted. 
The representation in each case is:

Eldarin: q0 -> q1 -> q2 -> q3 -> q4 -> q5 -> q6 -> q7

Elear: q0 -> q1 -> q2 -> q8 -> q9 -> q10

Elen: q0 -> q1 -> q2 -> q8 -> q12 

Eleni: q0 -> q1 -> q2 -> q8 -> q12 -> q13

Elenion: q0 -> q1 -> q2 -> q8 -> q12 -> q13 -> q14 -> q15

Elenya: q0 -> q1 -> q2 ->q8 -> q12 -> q16 -> q17

Emyn: q0 -> q1 -> q11 -> q6 -> q7

## Implementation
For my lexical analysis, and used the regular expressión in the file *regexp.py*. In the file, if you give them the words of the list, it should return a yes, but if the word is slightly different,t it should be a no.

Elear -> Yes

Eleni -> Yes

Elenya -> Yes

Eleear  -> No

Elenioni  -> No

The regular expression is written like this;

^E((l(darin|ear|en(i(on)?|ya)?))|(myn))$

^ = asserts a position at the start of the line
$ = asserts a position at the end of the line

And using Regex101.com I checked if it worked or not.

![Regex](Regex.png)

## Prolog
To run a proper prolog, use *prolog.pl* and the test with *test_prolog.pl*.
The implementation goes for a series of *transitions*, which are the specific ways the transitions can occur, and also a set of the *final states* that can be reached. It uses 2 predicates that help to know if the word is correct of it is not, which are: *recover_automaton* and *automatonCheck*, using recursion on the last one to check the whole list of elements.

```
automatonCheck([Symbol | Rest], State) :-
    transition(State, Symbol, NextState),
    automatonCheck(Rest, NextState).
```

## Tests
The file *tests_regexp.py* has all the cases tested for regular expressions. It includes 20 tests, of which only 7 are valid, and will pass. If the word entered in the py file is incorrect, the test will not appear.

## Analysis
Starting with the time complexity, the main factor to use is the behavior of the function of the library re (for regular expressions), which is re.match(). Using a DFA with a linear runtime means that I didn’t use any kind of repetition with the symbols * or + in my regex. That leads to the conclusion that the time can be in **O(n)**.

If we go with the cases that do not match, like just using an “E”, it terminates ins **O(1)**. While in any other length of the string, it goes to **O(n)**. The complexity is not more complex because the code does not have any kind of loops within other loops or something that can make it more complex.

Taking into consideration the predicate *automatonCheck*, which uses recursion, ends with the time complexity of **O(n)**. As a result of checking every element of the list one by one until getting a "true or false". And in terms of space, it grows linearly due to the same recursion, ending with also and **O(n)**.

## References
Lambenor. (n.d.). Quenya. http://lambenor.free.fr/ardalambion/quenya.html 

Tolkien Gateway. (n.d.). Quenya. https://tolkiengateway.net/wiki/Quenya 

GeeksforGeeks. (n.d.). Introduction of finite automata. https://www.geeksforgeeks.org/introduction-of-finite-automata/ 
