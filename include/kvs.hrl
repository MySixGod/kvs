%%%-------------------------------------------------------------------
%%% @author cwt  <woshi6ye@gmail.com>
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. 八月 2017 15:54
%%%-------------------------------------------------------------------
-author("cwt").

-record(engine, {name,
  mod,
  ref,
  key_enc,
  val_enc,
  options}).

-type engine() :: #engine{}.
-export_type([engine/0]).
