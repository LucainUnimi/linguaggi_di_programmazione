-module(accumulate).
-export([
         accumulate/2
        ]).

accumulate(L, F) when is_list(L) -> [ F(X) || X <- L];
accumulate(_,_) -> error.
