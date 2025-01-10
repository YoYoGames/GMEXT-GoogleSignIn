
if (async_load[? "type"] == "google_signin_login_oauth") {
	// At this point the OAuth happened within the server
	// we need to query the token from the server now.
	alarm[0] = game_get_speed(gamespeed_fps);
}
