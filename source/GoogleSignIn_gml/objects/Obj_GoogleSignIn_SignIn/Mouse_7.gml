
var client_id = ""

if(os_browser != browser_not_a_browser)
	client_id = "20722703459-v53e1l6aeist3nrupt3oc0casrf1jsa0.apps.googleusercontent.com"
else	
{
	if(os_type == os_android)
		client_id = "20722703459-v53e1l6aeist3nrupt3oc0casrf1jsa0.apps.googleusercontent.com"
	//secret: 8JWQbXEiHH31W7Z0KM0ggE0j


	if(os_type == os_ios)
		client_id = "20722703459-bb8lnfpgj83fuao2sn48ugv7jr7urpol.apps.googleusercontent.com"
	//com.googleusercontent.apps.20722703459-bb8lnfpgj83fuao2sn48ugv7jr7urpol
}

if(client_id != "")
	GoogleSignIn_Show(client_id)
