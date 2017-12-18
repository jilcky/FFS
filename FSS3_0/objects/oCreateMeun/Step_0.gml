/// @description 

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
var C= collision_point(Objx+16,Objy+16,oObject,0,1)
	#region 摆放物体
	if mouse_check_button(mb_left)
	{
		if C //检测有没有东西
		{
		}
		else
		{
			//创建
			//layer_get_id()
		instance_create_layer(Objx,Objy,"Obj",oObject)
		}
	}
	#endregion
#region 右键删除
	if mouse_check_button(mb_right)
	{
		if C//检测有没有东西
		{	with(C){
			instance_destroy()
			}
		}
	
	}
#endregion

#region 缩放
	if mouse_wheel_up() and GameCamSize < 1
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
if mouse_wheel_down() and GameCamSize >0.4
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
if device_mouse_check_button_pressed(0,mb_middle)
{
	GameSufSMx = GameSufMx;
	GameSViewX = camera_get_view_x(view_camera[0])
	GameSufSMy = GameSufMy;	
	GameSViewY =  camera_get_view_y(view_camera[0])
}
if device_mouse_check_button(0,mb_middle)
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

/*
#region 最上方按钮检测
	if mouse_check_button_pressed(mb_left)
		{
var Map = TopButtonList[|0]
var xx = 1280-TopButtonWidth
var yy = 0

if device_mouse_x_to_gui(0) - xx > 0 and device_mouse_x_to_gui(0) - xx < TopButtonWidth
and device_mouse_y_to_gui(0) - yy > 0 and device_mouse_y_to_gui(0) - yy < TopButtonHeight
{
	for (var i = 0; i < ds_list_size(TopButtonList); ++i) {
	    var Map = TopButtonList[|i]
	var xx = 1280-TopButtonWidth+Map[?"X"]
	var yy = 0
	var w = Map[?"W"]
	var h = Map[?"H"]
	if device_mouse_x_to_gui(0) - xx > 0 and device_mouse_x_to_gui(0) - xx < w
	and device_mouse_y_to_gui(0) - yy > 0 and device_mouse_y_to_gui(0) - yy < h
	{
	
			ShowDebug(Map[?"Str"])
		
	}
	}
	}
	
}
#endregion

#region 图层位置按钮
	if mouse_check_button_pressed(mb_left)
		{
var Map = LayerButtonList[|0]
var w = Map[?"W"] 
var h = Map[?"H"]
var xx = Map[?"X"] + GameSufX - w
var yy = Map[?"Y"] + GameSufY 

//if device_mouse_x_to_gui(0) - xx > 0 and device_mouse_x_to_gui(0) - xx < LayerButtonWidth
//and device_mouse_y_to_gui(0) - yy > 0 and device_mouse_y_to_gui(0) - yy < LayerButtonHeight
{
	for (var i = 0; i < ds_list_size(LayerButtonList); ++i) {
	 var Map = LayerButtonList[|i]
var w = Map[?"W"] 
var h = Map[?"H"]
var	xx = Map[?"X"] + GameSufX - w
var	yy = Map[?"Y"] + GameSufY 
var 	str = Map[?"Str"]
	if device_mouse_x_to_gui(0) - xx > 0 and device_mouse_x_to_gui(0) - xx < w
	and device_mouse_y_to_gui(0) - yy > 0 and device_mouse_y_to_gui(0) - yy < h
	{
	
			ShowDebug(Map[?"Str"])
		
	}
	}
	}
	
}
#endregion