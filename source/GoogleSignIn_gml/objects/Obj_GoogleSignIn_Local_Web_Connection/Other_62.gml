/// @description Insert description here
// You can write your code in this editor

if (code_exchange_request != async_load[? "id"]) {
	return;
}

var _result = json_parse(async_load[? "result"]);

if (struct_exists(_result, "access_token")) {
	
	// This is a special response which only purpose is to kill the tab opened by the authentication mechanism
	var _close_tab_script = 
		"HTTP/1.1 200 OK" + "\r\n" +		// This represents a successful result from the server
		"Content-Type:text/html" + "\r\n" + // This specifies the type of content (HTML)
		"Content-Length:237" + "\r\n\r\n" + // For security reasons we add the content length so we know that it isn't easily tempered with
		"<html>" +
			"<head>" +
				// This is optional (just informative)
				"<title>Authentication Complete</title>" +
				// This JS script wil attempt to close the window and fallback to a message if it fails to
				"<script>try{window.open('','_self').close();}catch(e){document.body.innerHTML='<p>Authentication successful. Please close this window manually.</p>';}</script>" +
			"</head>" +
			// This will be used later by the JS script as fallback mechanism
			"<body></body>" +
		"</html>";
				
	var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_string, _close_tab_script);
	network_send_raw(connected_client_auth_socket, _buff, buffer_tell(_buff));
	buffer_delete(_buff);
	
	network_destroy(server_auth_socket);
	
	connected_client_auth_socket = undefined;
	server_auth_socket = undefined;
		
	var _map = ds_map_create();
	_map[? "idToken"] = _result.id_token;
	_map[? "type"] = "GoogleSignIn_Show";
	_map[? "success"] = true;
	event_perform_async(ev_async_social, _map);
	
	instance_destroy();
}