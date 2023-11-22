-module(rna).
-export([
         transcription/1,
         tran/1
        ]).


tran(L) -> [transalte(H) || H <- L].

transalte(X) ->
  case X of
    $A -> $U;
    $T -> $A;
    $C -> $G;
    $G -> $C
  end.

transcription([]) -> [];
transcription([H|T]) ->
  case H of
    $A -> [$U|transcription(T)];
    $T -> [$A|transcription(T)];
    $C -> [$G|transcription(T)];
    $G -> [$C|transcription(T)]
  end.

