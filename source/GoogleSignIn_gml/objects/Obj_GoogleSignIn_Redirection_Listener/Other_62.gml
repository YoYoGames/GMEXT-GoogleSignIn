
show_debug_message(json_encode(async_load))
if(search_request == async_load[?"id"])
{
	if(async_load[?"result"] == "NO_EXISTS")
	{
		alarm[0] = room_speed
		exit
	}
	
	var _code = async_load[?"result"]
	code_exchange_request = __google_signin_exchange_code(client_id, redirect_url, client_secret, verifier, _code);
}

if(code_exchange_request == async_load[? "id"])
{
	var _result = json_parse(async_load[? "result"]);

	if (struct_exists(_result, "access_token")) 
	{
		var _map = ds_map_create();
		_map[? "idToken"] = _result.id_token;
		_map[? "type"] = "GoogleSignIn_Show";
		_map[? "success"] = true;
		event_perform_async(ev_async_social, _map);
	
		instance_destroy();
	}
}

