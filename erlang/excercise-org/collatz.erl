-module(collatz).
-export([
         conjecture/1
        ]).

conjecture(N) when is_integer(N) -> aux(N,1);
conjecture(_) -> error.

aux(1, M) -> M;
aux(N, M) when (N rem 2 =:= 0) -> aux(N div 2, M+1);
aux(N, M) -> aux(3*N+1, M+1).
