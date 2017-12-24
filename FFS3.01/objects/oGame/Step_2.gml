/// @description 
#region 记录鼠标位置
MouseOldX = mouse_x
MouseOldY = mouse_y
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