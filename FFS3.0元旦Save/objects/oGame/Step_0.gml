/// @description 
#region 鼠标使用检测
#region 周期清理

if MouseUseClearTime >= room_speed*3 
{
	MouseUseClearTime = 0
	MouseUse = false	
}
#endregion
#region 键盘手柄使用后也关闭
if keyboard_check(vk_anykey)
{
	MouseUse = false		
}
#endregion
#region 检测使用
//鼠标被移动
if device_mouse_x_to_gui(0) != MouseOldX and device_mouse_y_to_gui(0) != MouseOldY and MouseUse = false 
or mouse_check_button(mb_any) or mouse_wheel_down() or mouse_wheel_up()
{
	MouseUse = true
	
}
if MouseUse
{
MouseUseClearTime++
}
#endregion

#endregion


