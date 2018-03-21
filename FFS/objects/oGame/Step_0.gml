if keyboard_check_pressed(ord("R")) and keyboard_check(vk_control)
{
	show_message("刷新房间")
	room_restart()
}
run = 1
if keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter)
{
	var W = window_get_fullscreen()
	W^=true
	window_set_fullscreen(W)
}


if room = rGameStart
{

room_goto_next()
}

if window_get_fullscreen() = 0{
    var Size = window_get_width()/window_get_height()
if  Size != 16/9
window_set_size( window_get_width() , window_get_width()*9/16)
}