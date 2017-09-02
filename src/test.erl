%%%-------------------------------------------------------------------
%%% @author cwt  <woshi6ye@gmail.com>
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 八月 2017 15:11
%%%-------------------------------------------------------------------
-module(test).
-author("cwt").

-include("kvs.hrl").

%% API
-compile(export_all).

t1() ->
  Name = test,
  {ok, Engine} = kvs:open(Name, [{backend, kvs_ets}]),
  Key = <<"aa">>,
  Value = [1,2, "hello"],
  ok =  kvs:put(Engine, Key, Value),
  erlang:display({value, kvs:get(Engine, Key)}).

t2() ->
  Name = test,
  {ok, Engine} = kvs:open(Name, [{backend, kvs_ets}, {persistence, true}]),
  Key = <<"aa">>,
  Value = kvs:get(Engine, Key),
  erlang:display(Value).

compile(String) ->
  [ParseTree] = element(2,
    erl_parse:parse_exprs(
      element(2,
        erl_scan:string(String)))),
  generate_code(ParseTree).
generate_code({op, _Line, '+', Arg1, Arg2}) ->
  generate_code(Arg1) ++ generate_code(Arg2) ++ [add];
generate_code({op, _Line, '*', Arg1, Arg2}) ->
generate_code(Arg1) ++ generate_code(Arg2) ++ [multiply];
generate_code({integer, _Line, I}) -> [push, I].


interpret(Code) -> interpret(Code, []).
interpret([push, I |Rest], Stack) -> interpret(Rest, [I|Stack]);
interpret([add |Rest], [Arg2, Arg1|Stack]) -> interpret(Rest, [Arg1+Arg2|Stack]);
interpret([multiply|Rest], [Arg2, Arg1|Stack]) -> interpret(Rest, [Arg1 * Arg2|Stack]);
interpret([], [Res|_]) -> Res.
