
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
	
#region 触发菜单
	switch (Select) {
		case 0:
		#region 语言
		    
			var Post = ds_list_find_index(oGame.LanguageList,oGame.Language)
			
	       if KeyCheck("左",0) Post--
		     if Post = -1
				Post = ds_list_size(oGame.LanguageList)-1
		   
		   if KeyCheck("右",0) or (mouse_check_button_pressed(mb_left) and oGame.MouseUse ) 
		   Post++
		   
		   if Post = ds_list_size(oGame.LanguageList) 
				Post = 0
		   
		   
		   oGame.Language = oGame.LanguageList[|Post]
		   
	      
		#endregion
		  break;
		  case 1:
		#region BGM音量
		if KeyCheck("左",1) or mouse_wheel_down()
		{
		oGame.BGMvolume--
		oGame.BGMvolume = max(oGame.BGMvolume,0)
		}
		if KeyCheck("右",1) or mouse_wheel_up()
		{
		oGame.BGMvolume++
		oGame.BGMvolume = min(oGame.BGMvolume,100)
		}
		
		
		#endregion
		break;
		case 2:
		#region SE音量
		if KeyCheck("左",1) or mouse_wheel_down()
		{
		oGame.SEvolume--
		oGame.SEvolume = max(oGame.SEvolume,0)
		}
		if KeyCheck("右",1) or mouse_wheel_up()
		{
		oGame.SEvolume++
		oGame.SEvolume = min(oGame.SEvolume,100)
		}
		
		
		#endregion
		break;
		case 3: 
		#region 修改窗口
		if KeyCheck("左",0) or mouse_wheel_down()
		{
			oGame.WindowsSize-=0.05
			oGame.WindowsSize = max(0.5,oGame.WindowsSize)
			window_set_size(1280*oGame.WindowsSize,720*oGame.WindowsSize)
		}
		
		if KeyCheck("右",0) or mouse_wheel_up()
		{
			oGame.WindowsSize+=0.05
			oGame.WindowsSize = min(1.4,oGame.WindowsSize)
			window_set_size(1280*oGame.WindowsSize,720*oGame.WindowsSize)
			
		
		}
		#endregion
		break;
		
		case 4 :
		#region //切换全屏
			if KeyCheck("确定",0) or (oGame.MouseUse and mouse_check_button_pressed(mb_left))
			{
		   oGame.WindowFull ^= true;
			window_set_fullscreen(oGame.WindowFull)
			}
		#endregion
		  break;
		
		    case 5 :
		 #region //返回
		  	if KeyCheck("确定",0) or (oGame.MouseUse and mouse_check_button(mb_left))
				{
		      Instance_Change(oTitleMeun,1)
				}
					 #endregion
		     break;
			
			
		
	    default:
	        // code here
	        break;
	}

#endregion