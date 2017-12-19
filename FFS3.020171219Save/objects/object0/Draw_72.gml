//过于缩小无法看清


/*
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
		  draw_text(32*Size*a,0,32*Size*a)
		}
		
		  	for (var b = 0; b < room_width div 32*Size +1; ++b) {
			
			draw_line(0,b*32*Size,room_width,b*32*Size)
			draw_text(0,b*32*Size,b*32*Size)
		}
		surface_reset_target()
   }
   else
     if surface_exists(LineSuf)
  {
	   draw_surface(LineSuf,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
  }
   #endregion
}