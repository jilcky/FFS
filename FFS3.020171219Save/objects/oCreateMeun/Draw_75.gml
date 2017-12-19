if debug_mode{
	draw_set_valign(0)
	draw_set_halign(0)
#region Debug内容
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fontDebug)
  var Meun;
Meun[0]  = "device_mouse_x_to_gui(0):"+string( device_mouse_x_to_gui(0))
Meun[1]  = "device_mouse_y_to_gui(0):"+string( device_mouse_y_to_gui(0))
Meun[2] = "GameSufMx:"+string(GameSufMx)+"    "+string(GameSufMx/GameSufW*100)+"%"
Meun[3] = "GameSufMy:"+string(GameSufMy)+"    "+string(GameSufMy/GameSufH*100)+"%"
Meun[4] = "camera_get_view_width():"+string(camera_get_view_width(view_camera[0]))
Meun[5] = "camera_get_view_height():"+string(camera_get_view_height(view_camera[0]))
Meun[6] = "Objx"+string(Objx)
Meun[7] = "Objy"+string(Objy)

	for (var i = 0; i < array_length_1d(Meun); ++i) {
		var Str = Meun[i]
		var h = string_height(Meun[i])
	 draw_text(0,32+i*h,Str)
	}
	
	if device_mouse_x_to_gui(0) - GameSufX > 0 and device_mouse_x_to_gui(0) - GameSufX < GameSufW
and device_mouse_y_to_gui(0) - GameSufY > 0 and device_mouse_y_to_gui(0) - GameSufY < GameSufH
{  draw_set_color(c_red)
	draw_rectangle(GameSufX,GameSufY,GameSufW+GameSufX,GameSufH+GameSufY,1)
}
	
#endregion/// @description 

}
