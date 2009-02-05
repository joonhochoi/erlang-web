%% The contents of this file are subject to the Erlang Web Public License,
%% Version 1.0, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Web Public License along with this software. If not, it can be
%% retrieved via the world wide web at http://www.erlang-consulting.com/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% The Initial Developer of the Original Code is Erlang Training & Consulting
%% Ltd. Portions created by Erlang Training & Consulting Ltd are Copyright 2009,
%% Erlang Training & Consulting Ltd. All Rights Reserved.

%%%-------------------------------------------------------------------
%%% File    : e_cache.erl
%%% @author Michal Ptaszek <michal.ptaszek@erlang-consulting.com>
%%% @doc Interface module for managing both: 
%%% <ul>
%%%  <li>Xmerl parsed structures</li>
%%%  <li>Generic frontend content</li>
%%% </ul>
%%% The Xmerl parsed structure cache implementation could be changed
%%% in the <i>project.conf</i> file, by placing a proper parameter:
%%% <i>{xmerl_cache, <b>Type</b>}</i> where <b>Type</b> is either
%%% <i>disk</i> or <i>ets</i> (by default it is set to <i>ets</i>).
%%% @end
%%%-------------------------------------------------------------------
-module(e_cache).

-export([read_file/1, install/0]).

%%
%% @spec read_file(Filename :: string()) -> XmerlStructure :: term()
%% @doc Returns the content of the file parsed by the xmerl parser.
%% If the file content is not found in the cache, the file is read and
%% put there.
%% @end
%%
-spec(read_file/1 :: (string()) -> term()).	     
read_file(Filename) ->
    Mod = e_conf:xmerl_cache_mod(),
    Mod:read_file(Filename).

%% @hidden
-spec(install/0 :: () -> none()).	     
install() ->
    case e_conf:xmerl_cache_mod() of
	e_cache_ets ->
	    e_cache_ets:install();
	_ ->
	    ok
    end.