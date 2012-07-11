-module(emob_web_info_controller, [Req, SessionID]).
-export([about/2, team/2]).

about('GET', []) ->
	{ok, LoggedIn} = emob_web_user:check_auth(SessionID),
	{ok, [{logged_in, LoggedIn}]}.

team('GET', []) ->
	{ok, LoggedIn} = emob_web_user:check_auth(SessionID),
	{ok, [{logged_in, LoggedIn}]}.
