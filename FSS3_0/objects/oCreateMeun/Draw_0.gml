/// @description 

if GameCamSize <=1{
#region 刷新 线表面 大小为一个房间
      if !surface_exists(LineSuf )
   {
		LineSuf  = surface_create(room_width,room_height);
		surface_set_target(LineSuf)
		draw_set_alpha(1)
		draw_set_font(fontDebug)
		draw_set_color(c_white)
		var Size = 2 
		//画竖的线
		for (var a = 0; a < room_height div 32*Size +1; ++a) {
			
		  draw_line(32*Size*a,0,32*Size*a,room_height)
		   draw_line(32*Size*a+1,0,32*Size*a+1,room_height)
		//  draw_text(32*Size*a,0,32*Size*a)
		}
		
		  	for (var b = 0; b < room_width div 32*Size +1; ++b) {
			draw_line(0,b*32*Size+1,room_width,b*32*Size+1)
			draw_line(0,b*32*Size,room_width,b*32*Size)
		//	draw_text(0,b*32*Size,b*32*Size)
		}
		surface_reset_target()
   }
   else
     if surface_exists(LineSuf)
  {
	//  draw_surface(LineSuf,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
	draw_surface(LineSuf,0,0)
  }
   #endregion
}
#region 刷新 游戏画面
if !surface_exists(GameSuf)
   {
    GameSuf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
   view_surface_id[0] = GameSuf
   
   }
#endregion

#region 物品位置
if device_mouse_x_to_gui(0) - GameSufX > 0 and device_mouse_x_to_gui(0) - GameSufX < GameSufW
and device_mouse_y_to_gui(0) - GameSufY > 0 and device_mouse_y_to_gui(0) - GameSufY < GameSufH
{
	draw_set_color(c_white)
	draw_set_alpha(1)
draw_rectangle(Objx,Objy,Objx+32,Objy+32,0)

	
	var C= collision_point(Objx+16,Objy+16,oObject,0,1)
	if !C 
	draw_set_color(c_green)
	else
	draw_set_color(c_red)
	
	draw_set_alpha(0.5)
draw_rectangle(Objx,Objy,Objx+32,Objy+32,0)
draw_set_alpha(1)

}


#endregion
