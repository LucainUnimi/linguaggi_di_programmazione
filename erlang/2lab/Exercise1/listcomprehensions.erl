-module(listcomprehensions).
-export([
         squared_int/1,
         symmetric_difference/2,
         intersect/2
        ]).

squared_int(L) -> [ X * X || X <- L, is_integer(X)].

intersect(A, B) -> [H || H <- A, T <- B, H =:= T].

symmetric_difference(A, B) -> [ X || X <- lists:merge(A,B), not(lists:member(X,A)) orelse not(lists:member(X,B)) ].

