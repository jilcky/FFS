/// @description 
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
