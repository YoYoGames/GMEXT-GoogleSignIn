
randomize()

search_url = extension_get_option_value("GoogleSignIn", "searchURL");

function create_code(digits = 4,characters = "0123456789")
{
	characters = string_replace(characters,"0","")//0 make issues.... just dont use it
	
	var str = ""
	repeat(digits)
		str += string_char_at(characters,irandom(string_length(characters)))
	
	return str
}

state = create_code()
var oauth_ins = instance_create_depth(0,0,0,Obj_GoogleSignIn_Oauth_Http,{state: state})

client_id = oauth_ins.client_id
client_secret = oauth_ins.client_secret
redirect_url = oauth_ins.redirect_url
verifier = oauth_ins.verifier

// You have all you need we can destroy the OAuth url starter
instance_destroy(oauth_ins);

search_request = undefined;
code_exchange_request = undefined;

alarm[0] = room_speed;

