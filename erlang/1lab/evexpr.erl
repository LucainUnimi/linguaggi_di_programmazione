-module(evexpr).
-export([
         parser/1
        ]).

parser(Expression) -> aux(Expression, [], []).


% simple([$(, N, Op, M, $)]) -> {Op, {num, N}, {num, M}};
% simple(_) -> false.



aux([], ACC, _)         -> ACC;
aux([$)|T], ACC, [A|S]) -> aux(T, [A|ACC], S);
aux([H|T], ACC, [A|S])  when H >= $0, $9 >= H
                        -> aux(T, ACC, [[{num, H - $0}|A]|S]);
aux([$(|T], ACC, S)     -> aux(T, ACC, [[]|S]);
aux([_|T], ACC, S)      -> aux(T, ACC, S).
