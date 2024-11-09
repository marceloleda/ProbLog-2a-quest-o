
% Definição do grafo
digraph alarm {
    str -> r;
    flw -> r;
    r -> v;
    v -> li;
    b -> li;
    k -> li;
}

% Definição dos valores possíveis para str
str(dry).
str(wet).
str(snow_covered).

% Probabilidades das variáveis
0.7::str(dry).
0.2::str(wet).
0.1::str(snow_covered).

% Probabilidades condicionais para Li
0.9::li :- v, b, k.
0.8::li :- v, b, \+k.
0.1::li :- v, \+b, k.
0.01::li :- v, \+b, \+k.
0.3::li :- \+v, b, k.
0.005::li :- \+v, b, \+k.
0.005::li :- \+v, \+b, k.
0.0::li :- \+v, \+b, \+k.

% Regras para consulta do item E
evidence(str(snow_covered), true).
query(v).

% Regras para cálculo
v :- str(snow_covered), r.
r :- str(snow_covered).

% Probabilidades condicionais para o cálculo
0.5::r :- str(snow_covered).
0.8::v :- r.
0.2::v :- \+r.