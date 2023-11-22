-module(queen).
-export([
         attack/2
        ]).



attack([_|R],[_|R])   -> true;
attack([C|_], [C|_])  -> true;
attack([C1|[R1|_]],[C2|[R2|_]]) when abs(C1-C2) =:= abs(R1-R2) -> true;
attack(_,_) -> false.
