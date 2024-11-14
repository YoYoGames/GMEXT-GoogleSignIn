

GoogleSignIn_Show()

if (os_type != os_android || os_type != os_ios || os_browser == browser_not_a_browser) {
	instance_create_depth(0,0,0, Obj_GoogleSignIn_Redirection_Listener)
}