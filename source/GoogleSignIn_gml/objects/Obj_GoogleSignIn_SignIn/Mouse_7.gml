
if(os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)
{
	GoogleSignIn_Show()
}
else
{
	//Login for Windwos/Mac/Linux and Maybe Other Platforms!!!!!
	if(object_exists(asset_get_index("Obj_GoogleSignIn_Local_Web_Connection")))
	with(Obj_GoogleSignIn_Local_Web_Connection)
		start_proccess()
}
