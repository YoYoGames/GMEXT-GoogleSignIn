// FUNCTIONS

/**
 * @func GoogleSignIn_Show
 * @desc This function shows the Google overlay popup to select a Google account to sign up with.
 * 
 * @event social
 * @member {string} type The string value `"GoogleSignIn_Show"`
 * @member {boolean} success Whether or not the requested task was successful
 * @member {string} idToken An ID token (authentication token) that you can send to your server.
 * @event_end
 * 
 * @func_end
 */

/**
 * @func GoogleSignIn_SignOut
 * @desc This function signs out the currently signed in user, if any.
 * 
 * [[Warning: This function is not compatible with HTML5 and will result in a no-op call.]]
 * 
 * @event social
 * @member {string} type The string value `"GoogleSignIn_SignOut"`
 * @member {boolean} success Whether or not the requested task was successful
 * @event_end
 * 
 * @func_end
 */

/**
 * @func GoogleSignIn_LoginOAuth
 * @desc This function starts the OAuth process for logging in with a Google account.
 * 
 * @param {string} state A unique state string used for security and validation during the OAuth process.
 * @param {string} [scopes] The scopes that will be requested when performing the OAuth authorization. Defaults to `"openid email profile"`.
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"GoogleSignIn_LoginOAuth"`
 * @member {string} redirect_uri The redirect URL as set in the Extension Options
 * @member {string} client_id The Client ID as set in the Extension Options
 * @member {string} state The state value passed in the original function call
 * @event_end
 * 
 * @example
 * ```gml
 * GoogleSignIn_LoginOAuth(state);
 * ```
 * The above code starts the OAuth login process for logging in with a Google account. Since the optional `scopes` parameter isn't provided, the default scopes are requested.
 * The function call will bring up a browser window in which the user can grant your game access to the requested scopes on the user's behalf.
 * 
 * The function finally triggers a ${event.social}: 
 * ```gml
 * /// Async - Social Event
 * if (async_load[? "type"] == "google_signin_login_oauth") {
 *     // At this point the OAuth happened within the server
 *     // we need to query the token from the server now.
 *     alarm[0] = game_get_speed(gamespeed_fps);
 * }
 * ```
 * 
 * If the user confirms, an authorisation code is sent to the URL that you've set under **OAuth Redirect URL** in the [Extension Options](manual.gamemaker.io/monthly/en/The_Asset_Editors/Extensions.htm#extension_options).
 * The Redirect URL is a URL on your own server to which the authorisation code is sent. Your server code needs to handle receiving the code and then send a POST request to the following endpoint to exchange the code for the access token: `https://oauth2.googleapis.com/token`. See the demo project for more information on what to include in the request to this endpoint.
 * 
 * If all went well, at one point your server will have received the access token. It is then up to your game to periodically (e.g., using an ${event.alarm}) send a POST request to the same server (to the search URL) to check if it has the token. The code to do this might look as follows:
 * 
 * ```gml
 * /// Alarm 0 Event
 * var _headers = ds_map_create();
 * ds_map_add(_headers, "Content-Type", "application/json");
 * 
 * var _body = json_stringify({ state: state });
 * 
 * search_request = http_request(search_url, "POST", _headers, _body);
 * ds_map_destroy(_headers);
 * ```
 * 
 * The HTTP request will either return a valid token or no token (e.g., when the server hasn't received the token yet) in the ${event.http}.
 * If no valid token was received, a new HTTP request can be made after a certain amount of time (e.g., after 1 second).
 * To limit the number of HTTP requests sent to your server this can be limited to a maximum number of tries.
 * 
 * @func_end
 */

// MODULES

/**
 * @module home
 * @title Google Sign-In
 * @desc Google Sign-In manages the OAuth 2.0 flow and token lifecycle, simplifying your integration with Google APIs.
 * 
 * * Show sign-in account selector
 * * Sign out of your account
 * 
 * [[Note: The Sign In functionality is available on Android, iOS/tvOS and HTML5 using the SDK as well as on all other platforms using OAuth.]]
 * 
 * @section Guides
 * @desc This section contains guides to get started with the Google Sign-In extension.
 * @ref page.setup
 * @section_end
 * 
 * @section_func Functions
 * @desc This is the list of available functions for the Google Sign-In extension. 
 * @ref GoogleSignIn_*
 * @section_end
 * 
 * @module_end
 */
