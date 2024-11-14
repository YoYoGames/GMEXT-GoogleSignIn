/// @description Insert description here
// You can write your code in this editor

#macro GOOGLE_OAUTH_ENDPOINT "https://accounts.google.com/o/oauth2/v2/auth"
#macro GOOGLE_TOKEN_ENDPOINT "https://oauth2.googleapis.com/token"

function create_code(digits = 4,characters = "0123456789")
{
	characters = string_replace(characters,"0","")//0 make issues.... just dont use it
	
	var str = ""
	repeat(digits)
		str += string_char_at(characters,irandom(string_length(characters)))
	
	return str
}


state = create_code()

redirect_uri = "https://googlesignin-tclduhxwfq-uc.a.run.app";
//redirect_uri = "http://127.0.0.1:5000/";
scope = "openid email profile";
authorization_endpoint = "https://accounts.google.com/o/oauth2/v2/auth";
token_endpoint = "https://oauth2.googleapis.com/token";

client_id = "20722703459-2lblr1ppet3454b102121vn0s8gkqls2";
client_secret = "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";

verifier = __google_signin_generate_code_verifier(128);
code_challenge = __google_signin_generate_code_challenge(verifier);

auth_url = authorization_endpoint + "?response_type=code" +
           "&scope=" + __google_signin_url_encode(scope) +
           "&redirect_uri=" + __google_signin_url_encode(redirect_uri) +
           "&client_id=" + __google_signin_url_encode(client_id) +
           "&code_challenge=" + code_challenge +
           "&code_challenge_method=S256" + "&state=" + state;

show_debug_message("auth_url: " + auth_url)

url_open(auth_url);