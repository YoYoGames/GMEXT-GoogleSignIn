/// @description Insert description here
// You can write your code in this editor

#macro GOOGLE_OAUTH_ENDPOINT "https://accounts.google.com/o/oauth2/v2/auth"
#macro GOOGLE_GOOGLE_TOKEN_ENDPOINT "https://oauth2.googleapis.com/token"

scope = "openid email profile";

client_id = extension_get_option_value("GoogleSignIn", "redirectClientID");
client_secret = extension_get_option_value("GoogleSignIn", "redirectClientSecret");
redirect_url = extension_get_option_value("GoogleSignIn", "redirectURL");

verifier = __google_signin_generate_code_verifier(128);
code_challenge = __google_signin_generate_code_challenge(verifier);

auth_url = GOOGLE_OAUTH_ENDPOINT + "?response_type=code" +
           "&scope=" + __google_signin_url_encode(scope) +
           "&redirect_uri=" + __google_signin_url_encode(redirect_url) +
           "&client_id=" + __google_signin_url_encode(client_id) +
           "&code_challenge=" + code_challenge +
           "&code_challenge_method=S256" + "&state=" + state;

show_debug_message("auth_url: " + auth_url)
url_open(auth_url);

