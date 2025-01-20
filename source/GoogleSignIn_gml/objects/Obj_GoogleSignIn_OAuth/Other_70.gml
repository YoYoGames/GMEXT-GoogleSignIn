
if (async_load[? "type"] == "GoogleSignIn_LoginOAuth") {
	// At this point the OAuth happened within the server
	// we need to query the token from the server now.
	alarm[0] = game_get_speed(gamespeed_fps);
}
