if(device_mouse_x_to_gui(0) >= x && device_mouse_y_to_gui(0) >= y && device_mouse_x_to_gui(0) < x + sprite_width && device_mouse_y_to_gui(0) < y + sprite_height)
{
    selected = true;
    showCursor = true;
    alarm[0] = cursorBlinkTime;
    keyboard_string = "";
    selectedStart = -1;
    cursor = textbox_get_cursor_at(id, device_mouse_x_to_gui(0));
    dragSelecting = true;
}
else
{
    selected = false;
    showCursor = false;
    alarm[0] = -1;
    dragSelecting = false;
}

