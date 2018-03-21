if (live_call()) return live_result;



  if mouse_x > (1280 - 800)/2 and mouse_x <  (1280 - 800)/2+800
and
    mouse_y > 128 and mouse_y < 128+450
{
    var _X = mouse_x - WinX - (1280 - 800)/2
    var _Y = mouse_y - WinY - 128
    for(var a = 0; a < surface_get_width(MapSurface)*MapSize div 16*MapSize;a++)
        {
    
        if _X > a*16*MapSize and _X < (a+1)*16*MapSize
        {
            GridX = a
            
            GridX = min(ds_grid_width(MapGrid),GridX)
        }
     }
    for(var b = 0; b < surface_get_height(MapSurface)*MapSize div 16*MapSize;b++)
        {   
       if _Y > b*16*MapSize and _Y < (b+1)*16*MapSize
        {
            GridY = b
            
             GridY = min(ds_grid_height(MapGrid),GridY)
        }
     }
     
        if mouse_check_button_pressed(  mb_middle)
    {
        SaveMX = mouse_x// - (1280 - 800)/2
        SaveMY = mouse_y// - 128
        WinSaveX = WinX
        WinSaveY = WinY
    }
  
    if mouse_check_button(  mb_middle)
    {
        PX = mouse_x
        PY = mouse_y
        WinX = WinSaveX -  (SaveMX - PX)
        WinY = WinSaveY -  (SaveMY - PY)
    }

    if mouse_wheel_up()
    MapSize+= 0.25
    if mouse_wheel_down()
    MapSize-= 0.25
}   
    MapSize = min(4,MapSize)
    MapSize = max(0.25,MapSize)

if keyboard_check_pressed(vk_escape)
{
    room_goto(rMeun)
}