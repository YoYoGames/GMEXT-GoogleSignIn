

if(async_load[?"type"] != "GoogleSignIn_SignOut") exit;

show_debug_message(json_encode(async_load));

if(async_load[?"success"])
	show_message_async("Signout SUCCESS")
else
	show_message_async("Signout FAILED")

