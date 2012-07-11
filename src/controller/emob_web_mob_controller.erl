-module(emob_web_mob_controller, [Req, SessionID]).
-export([view/2]).

view('GET', []) ->
	{ok, []}.
