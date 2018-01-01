/// @description 
#region 按钮
	#region 最上方按钮绘制选中
if mouse_check_button_pressed(mb_left)
if MouseGetGui(TopButtonX,TopButtonY,TopButtonWidth,TopButtonHeight)
{
for (var i = 0; i < array_length_1d(TopButton); ++i) {
	var xx = (TopButton_w+8)*i + TopButton_w/2   + TopButtonX
	var yy = TopButtonY
	//draw_rectangle(xx-TopButton_w/2,yy,xx+TopButton_w/2 ,yy+TopButton_h,true)
	if MouseGetGui(xx-TopButton_w/2,yy,TopButton_w,TopButton_h)
	{
		
	ShowDebug(TopButton[i])
	
	switch (TopButton[i]) {
	#region 保存
		    case "保存":		
			
	var file = global.MapFile //"本地地图/"+string(oLocalMapMeun.List[|oLocalMapMeun.Part])
	ini_open(file+"/Map.ini")
	scrSaveMap()
	ini_close()
	
	var Map = variable_instance_get(id,"Map全家桶")
	var Key = ds_map_find_first(Map)
	var Var = Key
	for (var i = 1; i < ds_map_size(Map); ++i) {
		Var = Key
		Key = ds_map_find_next(Map,Key)
		ds_map_destroy(Var)
	}
	ds_map_destroy(ds_map_find_first(Map))
	ds_map_destroy(Map)
	
	room_goto(rTitle)
	        break;
		#endregion
	#region 导出
		    case "导出":
			
			
	      var file;
		file = get_save_filename("地图|*.map", "");
		if file != ""
		 {
		ini_open(file)
		scrSaveMap()
		ini_close()
		 file_copy("Varmap.map",file)
		 }
	        break;
		#endregion
	#region 导入
	case "导入":
	   var file;
		file = get_open_filename("地图|*.map", "");
		if file != ""
		 {

	ini_open(file)
	scrLoadMap()
	ini_close()
		 }
	
	break;
	#endregion
	#region 清空
	case "清空":
	with(oObject){
	instance_destroy()
	}
	break;
	#endregion
	#region 删除
case "删除":

break;
#endregion
	#region 修改名称
	case "修改名称":
	var str = get_string("修改地图名称",MapInfo[?"名称"])
	if str!=""
	{
		MapInfo[?"名称"] = str
	}
	break;
	#endregion
	#region 修改描述
	case "修改描述":
	var str = get_string("修改地图描述",MapInfo[?"描述"])
	if str!=""
	{
		MapInfo[?"描述"] = str
	}
	break;
	#endregion
	#region 上传
	case "上传":
	if global.steam_api 
	if  !Publish_ID
{
	var app_id = steam_get_app_id();
	new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
}
else
{
	event_user(0)
}

	break;
	#endregion
	#region 修改封面
case "修改封面":
  var file;
		file = get_open_filename("封面|*.jpg;*.bmp;*.png", "");
		if file != ""
		{
//		file_bin_open(file,0)
	//	if file_bin_size(file)
	//	file_bin_close(file )
		}
break;
	#endregion
	
	
	    default:
	        // code here
	        break;
	}
	
	}
}

}
#endregion
	
		#region 选着分类按钮
if mouse_check_button_pressed(mb_left)
if MouseGetGui(PenSelectButtonX,PenSelectButtonY,PenSelectButtonWidth,PenSelectButtonHeight)
{
for (var i = 0; i < array_length_1d(PenSelectButton); ++i) {
	var xx = (PenSelectButton_w+8)*i + PenSelectButton_w/2   + PenSelectButtonX
	var yy = PenSelectButtonY
	//draw_rectangle(xx-PenSelectButton_w/2,yy,xx+PenSelectButton_w/2 ,yy+PenSelectButton_h,true)
	if MouseGetGui(xx-PenSelectButton_w/2,yy,PenSelectButton_w,PenSelectButton_h)
	{
		
	ShowDebug(PenSelectButton[i])

 
	
	
	if PenSelectButton[i] != PenSelect{
		PenSelect = PenSelectButton[i]	

		
	#region 刷新按钮列表信息
	var PenMap = variable_instance_get(id,"PenMap")
var AllPenMap = variable_instance_get(id,"AllPenMap")
	PenButton = 0
var Str = PenSelect
var Map= PenMap[?Str]
var key = ds_map_find_first(Map)
 PenButton[0] = key
 
 if ds_map_size(Map)>1
for (var i = 1; i < ds_map_size(Map); ++i) {
	
 PenButton[i] = ds_map_find_next(Map,key)
 key = ds_map_find_next(Map,key)

}

PenButton_w = 96
PenButton_h = 32
PenButtonWidth = 96+PenButton_w/2+8 //(PenButton_w+8)*array_length_1d(PenButton)+PenButton_w/2+8
PenButtonHeight = (PenButton_h+8)*array_length_1d(PenButton)//+PenButton_w/2+8
PenButtonX = 128//1280-PenButtonWidth//-PenButton_w
PenButtonY = 128
PenButtonSuf = -1
#endregion
	
			 #region 切换分类后 选择为第一i个
		PenName = PenButton[0]//ds_map_find_first(Map)
		var Map = PenMap[?PenSelect]
		Map = Map[?PenName]
		Map = Map[?"sprite_index"]
		PenSpr = Map
		#endregion
	if surface_exists(PenButtonSuf)
	  surface_free(PenButtonSuf)
	}
	}
}

}
#endregion
		
		#region 笔刷选择
if mouse_check_button_pressed(mb_left)
if MouseGetGui(PenButtonX,PenButtonY,PenButtonWidth,PenButtonHeight)
{
for (var i = 0; i < array_length_1d(PenButton); ++i) {
	//var xx = (PenButton_w+8)*i + PenButton_w/2   + PenButtonX
	//var yy = PenButtonY
	var xx = PenButtonX + PenButton_w/2 //+ (PenButton_w)//+8)*i + PenButton_w/2   +
	var yy = PenButtonY+ (PenButton_h+8)*i
	//draw_rectangle(xx-PenButton_w/2,yy,xx+PenButton_w/2 ,yy+PenButton_h,true)
	if MouseGetGui(xx-PenButton_w/2,yy,PenButton_w,PenButton_h)
	{
		
	ShowDebug(PenButton[i])
	PenName = PenButton[i]//ds_map_find_first(Map)
	var Map = PenMap[?PenSelect]
	Map = Map[?PenName]
	Map = Map[?"sprite_index"]
	PenSpr = Map

	}
}

}
#endregion
				
		#region 角度选择
if mouse_check_button_pressed(mb_left)
if MouseGetGui(ArgButtonX,ArgButtonY,ArgButtonWidth,ArgButtonHeight)
{
for (var i = 0; i < array_length_1d(ArgButton); ++i) {
	//var xx = (ArgButton_w+8)*i + ArgButton_w/2   + ArgButtonX
	//var yy = ArgButtonY
	var xx = ArgButtonX + ArgButton_w/2 //+ (ArgButton_w)//+8)*i + ArgButton_w/2   +
	var yy = ArgButtonY+ (ArgButton_h+8)*i
	//draw_rectangle(xx-ArgButton_w/2,yy,xx+ArgButton_w/2 ,yy+ArgButton_h,true)
	if MouseGetGui(xx-ArgButton_w/2,yy,ArgButton_w,ArgButton_h)
	{
		
	PenArg = i*90

	}
}

}
#endregion
		
#endregion

#region  在游戏窗口
if device_mouse_x_to_gui(0) - GameSufX > 0 and device_mouse_x_to_gui(0) - GameSufX < GameSufW
and device_mouse_y_to_gui(0) - GameSufY > 0 and device_mouse_y_to_gui(0) - GameSufY < GameSufH
{
#region 获取鼠标在游戏中的位置
	var GMX = device_mouse_x_to_gui(0) - GameSufX
GMX =max(GMX ,0)
GMX=min( GMX,GameSufW)
GameSufMx =GMX 

var GMY = device_mouse_y_to_gui(0) - GameSufY
GMY =max(GMY ,0)
GMY=min( GMY,GameSufH)
GameSufMy =GMY


Objx = GameSufMx/GameSufW*camera_get_view_width(view_camera[0]) + camera_get_view_x(view_camera[0])
Objx = Objx div 32 *32
Objy = GameSufMy/GameSufH*camera_get_view_height(view_camera[0]) + camera_get_view_y(view_camera[0])
Objy = Objy div 32*32
 #endregion
//var C= collision_point(Objx+16,Objy+16,oObject,0,1)
#region 摆放物体
	if mouse_check_button(mb_left)
	{
	var 	C = ds_grid_get(MapGrid, Objx div 32 ,Objy div 32)  
		if C //检测有没有东西
		{
		}
		else
		{
			//创建
			//layer_get_id()
			var map = Ds_Map_Create()
			ds_map_add(map,"name",PenName)
			ds_map_add(map,"image_angle",PenArg)
			ds_map_add(map,"image_alpha",PenAlp)
			MapGrid[#Objx div 32 ,Objy div 32] = map
 	////MapGrid[#Objx div 32 ,Objy div 32] = instance_create_layer(Objx,Objy,"Obj",oObject)
	//MapGrid[#Objx div 32 ,Objy div 32] .Name = PenName
	//MapGrid[#Objx div 32 ,Objy div 32] .sprite_index = PenSpr
	//MapGrid[#Objx div 32 ,Objy div 32] .image_angle = PenArg
	//MapGrid[#Objx div 32 ,Objy div 32] .image_alpha = PenAlp
	#region 设置表面
	surface_set_target(MapGridSuf )
			
	var xx;
	var yy;
	switch (PenArg) {
	    case 0:
	      xx = 0
		  yy = 0
	        break;
			
			 case 90:
	      xx = 0
		  yy = 0 -32
	        break;
			
			 case 180:
	      xx = 0 -32
		  yy = 0 - 32
	        break;
			
			 case 270:
	      xx = 0 -32
		  yy =0
	        break;
	  
	}
	
	draw_sprite_ext(PenSpr,0,(Objx div 32)*32-xx ,(Objy div 32)*32-yy,1,1,PenArg,c_white,1)
	
	


	
	surface_reset_target()
	#endregion

		}
	}
	#endregion
#region 右键删除
	if  mouse_check_button(mb_right)
	{
		var 	C = ds_grid_get(MapGrid, Objx div 32 ,Objy div 32)  
		if C//检测有没有东西
		{	
			
			ds_map_destroy(MapGrid[#Objx div 32 ,Objy div 32])
			MapGrid[#Objx div 32 ,Objy div 32] = 0
	surface_set_target(MapGridSuf)
	draw_clear_alpha(c_white,0)
			for (var a = 0; a < ds_grid_width(MapGrid); ++a) {
			   for (var b = 0; b < ds_grid_height(MapGrid); ++b) {
				   var Map = ds_grid_get(MapGrid,a,b)
			       if Map
				   {
				   #region 绘制
				   	#region 设置表面

			
	var xx;
	var yy;
	var Arg;
	var Spr;
	Arg = Map[?"image_angle"]
	Spr = GetIndex("s"+ Map[?"name"],asset_sprite)
	
	switch (Arg) {
	    case 0:
	      xx = 0
		  yy = 0
	        break;
			
			 case 90:
	      xx = 0
		  yy = 0 -32
	        break;
			
			 case 180:
	      xx = 0 -32
		  yy = 0 - 32
	        break;
			
			 case 270:
	      xx = 0 -32
		  yy =0
	        break;
	  
	}
	
	draw_sprite_ext(Spr,0,(a)*32-xx ,(b)*32-yy,1,1,Arg,c_white,1)
	
	


	

	#endregion
				   #endregion
				   }
					
			   }
			}
				surface_reset_target()
		}
	
	}
#endregion

#region 缩放
	if (mouse_wheel_up() or keyboard_check(vk_pageup) )and GameCamSize < 1
{
		GameCamSize+=0.05
		GameCamSize = min(GameCamSize,GameCameSizeMax )
		GameCamSize = max(GameCamSize,GameCameSizeMin)
		camera_set_view_size(view_camera[0],(GameCamSize*1280)div 2*2 ,(720*GameCamSize)div 2*2);
		var CX = camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0])*0.05 div 2*2
	CX = min(CX,room_width-camera_get_view_width(view_camera[0]))
	CX = max(CX,0)
	var CY = camera_get_view_y(view_camera[0])-camera_get_view_height(view_camera[0])*0.05 div 2 *2
	CY = min(CY,room_height-camera_get_view_height(view_camera[0]))
	CY = max(CY,0)
	camera_set_view_pos(view_camera[0],CX ,CY )
	
		
}
if( mouse_wheel_down() or keyboard_check(vk_pagedown)) and GameCamSize >0.4
{
	GameCamSize -=0.05
	GameCamSize = min(GameCamSize,GameCameSizeMax )
		GameCamSize = max(GameCamSize,GameCameSizeMin)
	
	camera_set_view_size(view_camera[0],(GameCamSize*1280)div 2*2 ,(720*GameCamSize)div 2*2);
	var CX = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.05 div 2 *2
	CX = min(CX,room_width-camera_get_view_width(view_camera[0]))
	CX = max(CX,0)
	var CY = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])*0.05  div 2*2
	CY = min(CY,room_height-camera_get_view_height(view_camera[0]))
	CY = max(CY,0)
	camera_set_view_pos(view_camera[0],CX ,CY)
	
	
}

	#endregion
#region 拉动窗口
//记录相对坐标
if device_mouse_check_button_pressed(0,mb_middle) or keyboard_check_pressed(vk_alt)
{
	GameSufSMx = GameSufMx;
	GameSViewX = camera_get_view_x(view_camera[0])
	GameSufSMy = GameSufMy;	
	GameSViewY =  camera_get_view_y(view_camera[0])
}
if device_mouse_check_button(0,mb_middle)  or keyboard_check(vk_alt)
{	var CX = GameSViewX - (((GameSufMx-GameSufSMx)/GameSufW)*camera_get_view_width(view_camera[0]))
	CX = min(CX,room_width-camera_get_view_width(view_camera[0]))
	CX = max(CX,0)
	var CY = GameSViewY - (((GameSufMy-GameSufSMy)/GameSufH)*camera_get_view_height(view_camera[0])) ;
	CY = min(CY,room_height-camera_get_view_height(view_camera[0]))
	CY = max(CY,0)
	camera_set_view_pos(view_camera[0],CX div 2 *2,CY div 2*2)
}


#endregion


}
#endregion
