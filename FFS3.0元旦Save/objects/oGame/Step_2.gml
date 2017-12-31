/// @description 
#region 记录鼠标位置
MouseOldX = device_mouse_x_to_gui(0)
MouseOldY = device_mouse_y_to_gui(0)
#endregion
#region Steam
#region SteamApi启动
if steam_initialised()
   {
   if steam_stats_ready() && steam_is_overlay_enabled()
      {
 steam_api = true;
      }
   }
#endregion
#endregion