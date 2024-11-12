
//#macro GOOGLESIGNIN_WEBSOCKET_TRIGGER_PARAMATER "launch=1"

function clean()
{
	if(server_auth_socket != noone)
	{
		network_destroy(server_auth_socket)
		server_auth_socket = noone
	}
	
	if(client_auth_socket != noone)
	{
		network_destroy(client_auth_socket)
		client_auth_socket = noone
	}
	
	if(connected_client_auth_socket != noone)
	{
		network_destroy(connected_client_auth_socket)
		connected_client_auth_socket = noone
	}
}

function start_proccess()
{
	clean()
	
	server_auth_socket = network_create_server_raw(network_socket_type, port, 32);
	while (server_auth_socket < 0 && port < port_max)
	{
		port++
		server_auth_socket = network_create_server_raw(network_socket_type, port, 32);
	}
	
	var login_url = "" //+ "?"+GOOGLESIGNIN_WEBSOCKET_TRIGGER_PARAMATER 
	url_open(login_url)
}


client_auth_socket = noone
server_auth_socket = noone
connected_client_auth_socket = noone

port = 6510;
port_max = 6520;
network_socket_type = network_socket_ws

string_send = ""


success_web = function()
{
	//Web side
	show_debug_message("LOGIN SUCCESS")
	show_message_async("LOGIN SUCCESS")
	
	game_end()
}

success_game = function(token)
{
	//Game/App side
	show_message_async(token)
	show_debug_message(token)
}



failed_web = function()
{
	//Web side
	show_debug_message("LOGIN FAILED")
	show_message_async("LOGIN FAILED")
}


failed_game = function()
{
	//Game/App side
	show_debug_message("LOGIN FAILED")
	show_message_async("LOGIN FAILED")
}



//for(var i = 0 ; i < parameter_count() ; i++)
//if(parameter_string(i+1) == GOOGLESIGNIN_WEBSOCKET_TRIGGER_PARAMATER)
//{
//	GoogleSignIn_Show()
//	break
//}
if(os_browser != browser_not_a_browser)
	GoogleSignIn_Show()
