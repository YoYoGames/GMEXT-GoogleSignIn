
if(async_load[?"type"] != "GoogleSignIn_Show") exit;

show_debug_message(json_encode(async_load))

if(async_load[?"success"])
{
	var _id_token = async_load[? "idToken"]
	show_debug_message($"Token: {_id_token}");
}

