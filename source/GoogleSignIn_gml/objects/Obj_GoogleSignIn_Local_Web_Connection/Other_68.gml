
switch(async_load[? "type"])
{
	case network_type_connect:
		connected_client_auth_socket = async_load[? "socket"]
		break;
	
	case network_type_data:
	
		var _data = buffer_read(async_load[? "buffer"], buffer_string);	
		var _start = string_pos("?code=", _data) + 6;
		
		if (_start == -1) {
			show_debug_message("[ERROR] Unable to obtain auth code")
			return;
		}
		
		var _end = string_pos_ext("&", _data, _start);
		var _code = string_copy(_data, _start, _end - _start);
		
		code_exchange_request = __google_signin_exchange_code(client_id, redirect_uri, client_secret, verifier, _code);
		break;
	
}
