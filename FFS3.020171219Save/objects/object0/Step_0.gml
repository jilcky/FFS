/// @description 

#region  游戏窗口
if device_mouse_x_to_gui(0) - GameSufX > 0 and device_mouse_x_to_gui(0) - GameSufX < GameSufW
and device_mouse_y_to_gui(0) - GameSufY > 0 and device_mouse_y_to_gui(0) - GameSufY < GameSufH
{
	var GMX = device_mouse_x_to_gui(0) - GameSufX
GMX =max(GMX ,0)
GMX=min( GMX,GameSufW)
GameSufMx =GMX 

var GMY = device_mouse_y_to_gui(0) - GameSufY
GMY =max(GMY ,0)
GMY=min( GMY,GameSufH)
GameSufMy =GMY


Objx = GameSufMx/GameSufW*camera_get_view_width(view_camera[0]) + camera_get_view_x(view_camera[0])
Objy = GameSufMy/GameSufH*camera_get_view_height(view_camera[0]) + camera_get_view_y(view_camera[0])
	
	
	#region 缩放
	if mouse_wheel_up() and GameCamSize < 1
{
		GameCamSize+=0.05
		GameCamSize = min(GameCamSize,1)
		GameCamSize = max(GameCamSize,0.1)
		camera_set_view_size(view_camera[0],(GameCamSize*1280)div 2*2 ,(720*GameCamSize)div 2*2);
		var CX = camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0])*0.05 div 2*2
	CX = min(CX,room_width-camera_get_view_width(view_camera[0]))
	CX = max(CX,0)
	var CY = camera_get_view_y(view_camera[0])-camera_get_view_height(view_camera[0])*0.05 div 2 *2
	CY = min(CY,room_height-camera_get_view_height(view_camera[0]))
	CY = max(CY,0)
	camera_set_view_pos(view_camera[0],CX ,CY )
	
		
}
if mouse_wheel_down() and GameCamSize >0.1 
{
	GameCamSize -=0.05
	GameCamSize = max(GameCamSize,0.1)
	GameCamSize = min(GameCamSize,1)
	
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
