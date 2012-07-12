-module(emob_transport).
-export([get_request_token/0, get_access_token/2, get_mobs/1]).

get_request_token() ->
	{ok, ApiUrl} = application:get_env(emob_web, api_root),
	TargetUrl = lists:flatten(io_lib:format("~s/get_request_token", [ApiUrl])),
	{ok, CBUrl} = application:get_env(emob_web, local_root),
	GetData = lists:flatten(io_lib:format("callback_url=~s/post_login", [CBUrl])),
	io:format("TargetUrl: ~p; GetData: ~p~n", [TargetUrl, GetData]),
	do_get(TargetUrl, GetData, true).

get_access_token(OAuthToken, OAuthVerifier) ->
	{ok, ApiUrl} = application:get_env(emob_web, api_root),
	TargetUrl = lists:flatten(io_lib:format("~s/get_access_token?oauth_token=~s&oauth_verifier=~s", [ApiUrl, OAuthToken, OAuthVerifier])),
	do_get(TargetUrl, [], true).

get_mobs(AccessToken) ->
	{access_token, Token} = AccessToken,
	{ok, ApiUrl} = application:get_env(emob_web, api_root),
	TargetUrl = lists:flatten(io_lib:format("~s/mobs?token=~s", [ApiUrl, Token])),
	do_get(TargetUrl, [], false).

do_get(Url, RequestBody, ParseJson) ->
	case ibrowse:send_req(Url, [{"Accept", "application/json"}], get, RequestBody, [{response_format, binary}]) of
		{ok, Code, Headers, ResponseBody} ->
			try
				case Code of
					"2" ++ _Tail ->
						case ParseJson of
							true ->
								ejson:decode(ResponseBody);
							_ ->
								ResponseBody
						end;
					_ ->
						{error, Code}
				end
			catch
				throw:Reason ->
					{error, Reason}
			end;

		{error, _Reason} = Error ->
			Error
	end.

