



redirect_uri = "http://127.0.0.1:5000/";
scope = "openid email profile";
authorization_endpoint = "https://accounts.google.com/o/oauth2/v2/auth";
token_endpoint = "https://oauth2.googleapis.com/token";

client_id = "";
client_secret = "";

verifier = __google_signin_generate_code_verifier(128);
code_challenge = __google_signin_generate_code_challenge(verifier);

auth_url = authorization_endpoint + "?response_type=code" +
           "&scope=" + __google_signin_url_encode(scope) +
           "&redirect_uri=" + __google_signin_url_encode(redirect_uri) +
           "&client_id=" + __google_signin_url_encode(client_id) +
           "&code_challenge=" + code_challenge +
           "&code_challenge_method=S256";

connected_client_auth_socket = -1;
code_exchange_request = -1;

server_auth_socket = network_create_server_raw(network_socket_tcp, 5000, 1);
if (server_auth_socket >= 0) {
	url_open(auth_url);
}