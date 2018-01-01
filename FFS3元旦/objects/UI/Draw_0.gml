/// @description 
/// @description 
#region 游戏编辑窗口
if GameCamSize <=1{
#region 刷新 线表面 大小为一个房间
      if !surface_exists(LineSuf )
   {
		LineSuf  = surface_create(room_width,room_height);
		surface_set_target(LineSuf)
		draw_set_alpha(1)
		draw_set_font(fDebug)
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

	draw_set_alpha(1)


	
	var C= collision_point(Objx+16,Objy+16,oObject,0,1)
	if !C 
	var Col = make_color_rgb(181,202,160)
	else
	var Col = make_color_rgb(220,159,180)
	
	//for (var i = 0; i < 360; i+=90) {
	//	PenArg = i
	//  var xx  = lengthdir_x(sprite_get_width( PenSpr),PenArg)*-1
	
	
	//var yy  = lengthdir_y(sprite_get_height(PenSpr),PenArg)*-1 //+ sprite_get_height(PenSpr)
	
	//ShowDebug(string(xx)+ " "+string(yy)+" "+string(i))
	//draw_sprite_ext(PenSpr,0,Objx+xx ,Objy+yy,1,1,PenArg,Col,1)
	//}
	
	//draw_sprite_ext(PenSpr,0,Objx+32 ,Objy+32,1,1,180,c_white,1)

	
	var xx;
	var yy;
	switch (PenArg) {
	    case 0:
	      xx = -32 +  32
		  yy = 0
	        break;
			
			 case 90:
	      xx = 0
		  yy = 32 - 32 -32
	        break;
			
			 case 180:
	      xx = 32 -32 -32
		  yy = 0 - 32
	        break;
			
			 case 270:
	      xx = 0 -32
		  yy = -32 + 32
	        break;
	  
	}
	draw_sprite_ext(PenSpr,0,Objx-xx ,Objy-yy,1,1,PenArg,Col,1)
	}
	
	


#endregion

#endregion

draw_surface(MapGridSuf,0,0)