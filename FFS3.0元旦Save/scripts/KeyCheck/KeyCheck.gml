var Key = argument0
var Mode = argument1

if keyboard_check(vk_anykey) or keyboard_check_released(vk_anykey)
#region 键盘检测
if ds_map_exists(oGame.KeyMap,Key)
{
	var List = oGame.KeyMap[?Key]
 for (var i = 0; i < ds_list_size(List); ++i) {
	 switch (Mode) {
	     case 0:
	         if keyboard_check_pressed(List[|i])
			 {
			return true
			}
	         break;
			  case 1:
	         if keyboard_check(List[|i])
			 {
			return true
			}
	         break;
			  case 2:
	         if keyboard_check_released(List[|i])
			 {
			return true
			}
	         break;
	   
	 }
		 
	   } 
}
else
{
show_debug_message(string(id)+"键位"+string(Key)+"没有注册")
}

#endregion

if false
#region 手柄
if ds_map_exists(oGame.GamePadMap,Key)
{
	var List = oGame.GamePadMap[?Key]
 for (var i = 0; i < ds_list_size(List); ++i) {
	 switch (Mode) {
	     case 0:
	         if gamepad_button_check_pressed(0,List[|i])
			{
			return true
			}
	         break;
			  case 1:
	         if gamepad_button_check(0,List[|i])
			 {
			return true
			}
	         break;
			  case 2:
	         if gamepad_button_check_released(0,List[|i])
			 {
			return true
			}
	         break;
	   
	 }
		 
	   } 
}

#endregion

return false

