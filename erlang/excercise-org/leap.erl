-module(leap).
-export([
         leap/1
        ]).

leap(X) when X rem 4 =:= 0, (not(X rem 100 =:= 0) orelse (X rem 400 =:= 0)) -> true;
leap(X) when is_integer(X) -> false;
leap(_) -> error.
