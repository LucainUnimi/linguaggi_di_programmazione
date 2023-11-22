-module(strain).
-export([
         keep/2,
         discard/2
        ]).

keep(L, F) -> [X || X <- L, F(X)].
discard(L, F) -> [X || X <- L, not F(X)].
