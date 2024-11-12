
if(GOOGLE_WEBSOCKET_LOCAL)
if(os_browser != browser_not_a_browser)
if(async_load[?"type"] == "GoogleSignIn_Show")
if(async_load[?"success"])
{
	string_send = async_load[?"idToken"]
	
	client_auth_socket = network_create_socket(network_socket_type);
	network_connect_raw_async(client_auth_socket,"localhost",port);
}

