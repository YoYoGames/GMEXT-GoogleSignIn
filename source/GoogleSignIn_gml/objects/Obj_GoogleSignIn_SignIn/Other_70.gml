
if(async_load[?"type"] != "GoogleSignIn_Show") exit;

show_debug_message(json_encode(async_load))

if(async_load[?"success"])
{
	var idToken = async_load[?"idToken"]
	show_message_async("Token: " + idToken)
}

