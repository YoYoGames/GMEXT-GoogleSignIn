
client_id = extension_get_option_value("", "");
redirect_uri = extension_get_option_value("", ""); 
client_secret = extension_get_option_value("", "");

verifier = Obj_GoogleSignIn_Oauth_Http.verifier;
state = Obj_GoogleSignIn_Oauth_Http.state;

// You have all you need we can destroy the OAuth url starter
instance_destroy(Obj_GoogleSignIn_Oauth_Http);

search_request = undefined;
code_exchange_request = undefined;

alarm[0] = room_speed;

