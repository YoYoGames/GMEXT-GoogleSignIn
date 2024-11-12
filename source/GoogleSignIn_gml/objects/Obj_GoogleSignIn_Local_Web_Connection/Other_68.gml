
switch(async_load[? "type"])
{
	case network_type_connect:
		
		if (async_load[?"id"] == server_auth_socket)
		{
			connected_client_auth_socket = async_load[?"socket"]
		}
	
	break;
	
	case network_type_data:
	
		//show_debug_message("network_type_data")
		if(async_load[?"id"] == connected_client_auth_socket)
		{
			var _data = buffer_read(async_load[? "buffer"], buffer_string);
			
			success_game(_data)
			
			var _buff = buffer_create(1024,buffer_grow,1)
			buffer_seek(_buff,buffer_seek_start,0)
			buffer_write(_buff,buffer_string,"OK")
			network_send_raw(connected_client_auth_socket,_buff,buffer_tell(_buff))
			buffer_delete(_buff)
			
			clean()
		}
		else
		if(async_load[?"id"] == client_auth_socket)
		{
			var _data = buffer_read(async_load[? "buffer"], buffer_string);
			
			if(_data == "OK")
			{
				success_web()
				clean()
			}
		}
	
	break;
		
	case network_type_non_blocking_connect:
		
		if(async_load[?"succeeded"])
		{
			show_debug_message("network_type_non_blocking_connect")
			//show_debug_message("network_type_non_blocking_connect")
			//show_debug_message([async_load[? "id"],client_auth_socket])
			if (async_load[?"id"] == client_auth_socket)
			{
				var _buff = buffer_create(1024,buffer_grow,1)
				buffer_seek(_buff,buffer_seek_start,0)
				buffer_write(_buff,buffer_string,string_send)
				network_send_raw(client_auth_socket,_buff,buffer_tell(_buff))
				buffer_delete(_buff)
			}
		}
		else
		{
			if(port > port_max)
			{
				show_debug_message("failed conecting to server")
				clean()
				failed_web()
				exit
			}
			
			port ++
			client_auth_socket = network_create_socket(network_socket_type);
			network_connect_raw_async(client_auth_socket,"localhost",port);
		}
		
	break;
}
