var xx = argument0 
var yy = argument1
var w = argument2
var h = argument3
if device_mouse_x_to_gui(0) - xx > 0 and device_mouse_x_to_gui(0) - xx < w
and device_mouse_y_to_gui(0) - yy > 0 and device_mouse_y_to_gui(0) - yy < h
 return true