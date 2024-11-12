
#macro GOOGLE_WEBSOCKET_LOCAL true


if(!GOOGLE_WEBSOCKET_LOCAL)
{
	instance_destroy()
	exit
}

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
	
	url_open("")
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
