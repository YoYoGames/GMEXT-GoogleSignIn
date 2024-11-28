
if(os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)
{
	GoogleSignIn_Show()
}
else
{
	//OAuth for other platforms!
	instance_create_depth(0,0,0,Obj_GoogleSignIn_OAuth)
}

