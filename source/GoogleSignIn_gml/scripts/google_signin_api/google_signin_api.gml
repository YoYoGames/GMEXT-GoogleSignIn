
/// Prevents the execution of this script as function and throws an error.
/// @ignore
function google_signin_function() {
	throw _GMFUNCTION_ + " :: script cannnot be call as a function";
}

#region Internal

/// Encodes a string for use in a URL by replacing reserved characters with their percent-encoded equivalents.
///
/// This function performs URL encoding for a given input string (_orig), ensuring that reserved characters
/// are encoded using their hexadecimal representation, while unreserved characters remain unchanged.
/// 
/// 1. Creates a reusable output buffer for constructing the encoded string.
///
/// 2. Iterates through each character in the input string.
///
/// 3. Writes unreserved characters directly to the buffer.
///
/// 4. For reserved or special characters, calculates the percent-encoded representation using bitwise operations.
///
/// 5. Writes the encoded representation into the buffer.
///
/// 6. Appends a null terminator to the buffer and returns the constructed URL-encoded string.
///
/// This function uses a static buffer for performance optimization.
///
/// @param {string} _orig The input string to encode for URL usage (ASCII only)
/// @returns {string} The URL-encoded version of the input string.
/// @ignore
function __google_signin_url_encode(_orig) {
    
	static _output_buffer = buffer_create(1, buffer_grow, 1);
	
    static _hex = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

	buffer_seek(_output_buffer, buffer_seek_start, 0);
	
	var _i = 1;
    repeat (string_length(_orig)) {
        //var _code = buffer_read(_input_buffer, buffer_u8);
		var _char = string_char_at(_orig, _i++);
		var _code = ord(_char);

        // Check if character is unreserved (ALPHA / DIGIT / "-" / "." / "_" / "~")
        if ((_code >= 65 && _code <= 90) ||    // A-Z
            (_code >= 97 && _code <= 122) ||   // a-z
            (_code >= 48 && _code <= 57) ||    // 0-9
            _code == 45 ||                    // -
            _code == 46 ||                    // .
            _code == 95 ||                    // _
            _code == 126) {                   // ~
			// Write directly to the output buffer
            buffer_write(_output_buffer, buffer_u8, _code);
        } else {
            // Use bitwise operations to get high and low nibbles
            var _high = (_code & $F0) >> 4;
            var _low = _code & $0F;
			buffer_write(_output_buffer, buffer_text, "%" + _hex[_high] + _hex[_low]);
        }
    }
	buffer_write(_output_buffer, buffer_u8, 0);
	
    return buffer_peek(_output_buffer, 0, buffer_string);
}

/// Generates a random state string with the specified number of digits using the provided allowed characters.
/// 
/// This function creates a random string of a specified length (_digits) using characters from a given set
/// (_allowed_chars). The generated string is commonly used as a state parameter in OAuth processes for
/// additional security.
/// 
/// 1. Validates the allowed characters string for ASCII compatibility and non-empty value.
/// 
/// 2. Creates buffers for generating the random state string.
/// 
/// 3. Randomly selects characters from the allowed characters set to populate the state string.
/// 
/// 4. Returns the generated state string and cleans up buffers used during the process.
/// 
/// @param {Real} _digits The number of characters to generate for the state string. Defaults to 32.
/// @param {String} _allowed_chars The set of allowed characters to use for generating the state string. Defaults to numeric digits.
/// @returns {String} A randomly generated state string or an empty string if the input is invalid.
/// @ignore
function __google_signin_state_create(_digits = 32, _allowed_chars = "0123456789")
{
	var _length = string_length(_allowed_chars);
	if (_length != string_byte_length(_allowed_chars)) {
		show_debug_message(_GMFUNCTION_ + " :: only ASCII characters are allowed.");
		return "";
	}
	
	if (_length == 0) {
		show_debug_message(_GMFUNCTION_ + " :: allowed characters is an empty string");
		return "";
	}
	
	var _out_buff = buffer_create(_digits, buffer_fixed, 1);
	var _input_buff = buffer_create(1, buffer_grow, 1);
	
	buffer_write(_input_buff, buffer_text, _allowed_chars); // don't write ending byte
	
	var _input_size = buffer_tell(_input_buff);
	repeat(_digits) {
		buffer_write(_out_buff, buffer_u8, buffer_peek(_input_buff, irandom(_input_size - 1), buffer_u8));
	}
	
	var _code = buffer_peek(_out_buff, 0, buffer_string);
	buffer_delete(_out_buff);
	buffer_delete(_input_buff);
	
	return _code;
}

#endregion

/// @desc Triggers the OAuth process for logging in with a Google account.
/// 
/// This function constructs the Google OAuth URL with the provided state parameter,
/// the client ID, and the redirect URI. It opens the URL to initiate the OAuth process
/// and triggers an asynchronous event to signal the start of the login flow.
/// 
/// 1. Retrieves the client ID and redirect URI from the extension's configuration options.
/// 
/// 2. Constructs the Facebook OAuth URL using the client ID, redirect URI, and state parameter.
/// 
/// 3. Opens the constructed URL to start the OAuth process.
/// 
/// 4. Creates an asynchronous event payload with OAuth initialization details and triggers the event.
/// 
/// @param {String} _state A unique state string used for security and validation during the OAuth process.
/// @param {String} _scopes The scopes that will be requested when performing the OAuth authorization. Defaults to 'openid email profile'.
function GoogleSignIn_LoginOAuth(_state, _scopes = "openid email profile") {
	
	#macro GOOGLE_OAUTH_ENDPOINT "https://accounts.google.com/o/oauth2/v2/auth"

	var _client_id = extension_get_option_value("GoogleSignIn", "oauthClientId");
	var _redirect_url = extension_get_option_value("GoogleSignIn", "oauthUrl");

	var _auth_url = GOOGLE_OAUTH_ENDPOINT
		+ "?response_type=code"
		+ "&scope=" + __google_signin_url_encode(_scopes)
		+ "&redirect_uri=" + __google_signin_url_encode(_redirect_url)
		+ "&client_id=" + __google_signin_url_encode(_client_id)
		+ "&state=" + _state;

	url_open(_auth_url);
	
	// Trigger async event which marks the moment of oauth init
	var _async_load = ds_map_create();
	_async_load[? "type"] = "google_signin_login_oauth";
	_async_load[? "redirect_uri"] = _redirect_url;
	_async_load[? "client_id"] = _client_id;
	_async_load[? "state"] = _state;
	
	event_perform_async(ev_async_social, _async_load);
}

