/// @description 
if room = rTitle
{
	depth = 200
	var size = 1280/1920;
	draw_sprite_ext(sTitleBG,0,0,0,size,size,0,c_white,1)
	draw_set_color(c_black)
	draw_set_alpha(0.6)
	draw_rectangle(0,0,1280,720,0)
	draw_set_alpha(1)
	
	draw_set_color(c_white)
}
#region Debug内容展示
	if debug_mode{
		draw_set_font(fDebug)
		draw_set_color(c_white)
		draw_set_halign(0)
		draw_set_valign(0)
	Text[0] = "Fps:"+string(fps)
	Text[1] = "Fps_real:"+string(fps_real)
	Text[2] = "MouseUse:"+string(MouseUse)
	Text[3] = "device_mouse_x_to_gui(0):"+string(device_mouse_x_to_gui(0))
	Text[4] = "Mouse_Y:"+string(device_mouse_y_to_gui(0))
	Text[5] = "Room:"+string(room_get_name(room))
	//Text[6] = "Time:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime())
	
	for (var i = 0; i < array_length_1d(Text); ++i) {
	  draw_text(0,i*(string_height(Text[i])+4),Text[i])
	}
	}
#endregion
