
var client_id = ""

if(os_browser != browser_not_a_browser)
	client_id = extension_get_option_value("GoogleSignIn", "html5ClientID");
else	
{
	if(os_type == os_android)
		client_id = extension_get_option_value("GoogleSignIn", "androidClientID");


	if(os_type == os_ios)
		client_id = extension_get_option_value("GoogleSignIn", "iosClientID");
}

if(client_id != "")
	GoogleSignIn_Show(client_id)
