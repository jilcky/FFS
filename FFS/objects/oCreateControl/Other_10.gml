if (live_call()) return live_result;

//重构 贴图
draw_set_color(c_red)
{
    if surface_exists(MapSurface)
    {
        
        surface_set_target(MapSurface)
        draw_clear_alpha(c_black,0)
                for(var a = 0;a< ds_grid_width(MapGrid);a++)
                {
                   for(var b = 0;b< ds_grid_height(MapGrid);b++)
                    {   
                        if ds_grid_get(MapGrid,a,b) != 0
                        draw_text(a*16,b*16,ds_grid_get(MapGrid,a,b) )
                    }
                }
        surface_reset_target()
              
    }
}