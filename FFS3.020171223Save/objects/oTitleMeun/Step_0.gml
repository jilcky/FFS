
#region 调整Part的选中
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 

	//刷
Map[?"选中"] = false;
	//覆盖
var map =  MeunButton[Select]
map[?"选中"] = true;
	
}
#endregion

#region //鼠标修改
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 
	if device_mouse_x_to_gui(0) > Map[?"X"] and device_mouse_x_to_gui(0) < Map[?"X"] +Map[?"W"]
and device_mouse_y_to_gui(0) > Map[?"Y"] and device_mouse_y_to_gui(0) < Map[?"Y"] +Map[?"H"]
and oGame.MouseUse
{
	Map[?"选中"] = true;
	Map[?"触碰"] = true;
	Select = i
}
else
{
	Map[?"触碰"] = false;
}
}
	#endregion

	#region  手柄键盘输入 调整Part的选中
	if KeyCheck("上",0)
	Select--
	
	if KeyCheck("下",0)
	Select++
	#endregion
	
	#region 选中 范围修正
	Select = max(Select,0)
	Select = min(Select,array_length_1d(MeunButton)-1)
	
	#endregion
	
	#region 选中+确定触发
	var Map =  MeunButton[Select] 
	if KeyCheck("确定",0) or (oGame.MouseUse and mouse_check_button_pressed(mb_left) and Map[?"触碰"] )
	{
		switch (Select) {
			case 1:
	//当玩家 没有订阅的内容的时候  强制进去订阅
if !steam_ugc_num_subscribed_items()
{ //Instance_Change(oTitleMeun,1)
steam_activate_overlay_browser("http://steamcommunity.com/workshop/browse/?appid=705840&browsesort=mostrecent&section=readytouseitems&actualsort=mostrecent&p=1")
}
else
{
	Instance_Change(oSteamMapMeun,1)
}
			break;
			
			  case 2 :
			Instance_Change(oLocalMapMeun,1)
			
				   break;
			  case 3 :
			Instance_Change(oOptionMeun,1)
			
				   break;
		    case 4 :
		        game_end()
		        break;
		    default:
		        // code here
		        break;
		}
	}
	#endregion
	