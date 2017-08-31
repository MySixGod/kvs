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


