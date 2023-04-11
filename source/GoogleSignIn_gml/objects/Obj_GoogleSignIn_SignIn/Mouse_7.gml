
var client_id = ""

if(os_browser != browser_not_a_browser)
	client_id = extension_get_option_value("GoogleSignIn", "html5ClientID");
else	
{
}

GoogleSignIn_Show()
