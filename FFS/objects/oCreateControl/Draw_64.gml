if (live_call()) return live_result;
#region 绘制一个 透明的黑底背景
draw_set_color(c_black)
var OldAlp = draw_get_alpha()
draw_set_alpha(0.6)
draw_rectangle(0,0,GameInfo.Width,GameInfo.Height,0)
draw_set_alpha(OldAlp)
#endregion

if true{
    
    
}//绘制菜单


if true {
    draw_set_font(fText)
    var map = ds_map_create()
    
    map[?"格子坐标X"] = string(GridX)
    map[?"格子坐标Y"] = string(GridY)
    
    map[?"画笔方向"] = PenAngle
    map[?"画笔编号"] = PenSelect 
    draw_set_color(c_white)
    draw_set_halign(2)
    var key = ds_map_find_first(map)
    var Size = ds_map_size(map)
    for(var i = 0; i < Size ; i++){
        var h = string_height(key)
        draw_text(GameInfo.Width,i*h + GameInfo.Height - Size*h ,string(ds_map_find_value(map,key))+":"+string(key))
        key = ds_map_find_next(map,key)
        
    }
    
    ds_map_destroy(map)
}//绘制数据

    
    //绘制表面
    if!surface_exists(MapSurface)
    {   
        //输出
        WinSurface = surface_create(800,450)
        //游戏物品图层
        MapSurface = surface_create(ds_grid_width(MapGrid)*16,ds_grid_height(MapGrid)*16)
        //光标图层
        LinkSurface = surface_create(ds_grid_width(MapGrid)*16,ds_grid_height(MapGrid)*16)
        //背景图层
        BGSurface = surface_create(ds_grid_width(MapGrid)*16,ds_grid_height(MapGrid)*16)
          if true{
            surface_set_target(BGSurface)
                 //画背景
      for(var a = 0;a< ds_grid_width(MapGrid)*16 div sprite_get_width(GameBG) +1;a++)
        {
            for(var b = 0;b< ds_grid_height(MapGrid)*16 div sprite_get_height(GameBG) +1 ;b++)
            {
                draw_sprite(GameBG,0,a*sprite_get_width(GameBG),b*sprite_get_height(GameBG))
            }
        }
         
            surface_reset_target()
            
        }//绘制背景
        //绘制内容
    draw_set_halign(0)
   
    }
    else
    {
      
        
        if true{        
        surface_set_target(LinkSurface)
    draw_set_halign(0)
     
    draw_clear_alpha(c_black,0)
                
    if MapSize >= 1 //只有在size1的情况下
        {
                //画出光标  
                if true {
                var X = GridX*16
                var Y = GridY*16
                draw_set_color(c_red)
                //draw_rectangle(X,Y,X+16,Y+16,0)
                
                draw_line(X,0,X,surface_get_height(MapSurface))
                draw_line(X+16,0,X+16,surface_get_height(MapSurface))
                
                draw_line(0,Y,surface_get_width(MapSurface),Y)
                draw_line(0,Y+16,surface_get_width(MapSurface),Y+16)
                }
                
                draw_set_color(c_white)
                //横标尺
                draw_set_font(fText)
                 for(var i = 0;i< ds_grid_width(MapGrid);i++)
                {
                    var X = i*Size*16
                    var W = Size*16
                   
                    
                  
                        draw_text(i*16,0,i)
            
                }
                //竖标尺
               for(var i = 0;i< ds_grid_height(MapGrid);i++)
                {
                    var X = i*Size*16
                    var W = Size*16
                   
                 
                        draw_text(0,16*i,i)
            
                }
                    }
        surface_reset_target()
        
} //标尺表面

        if true{        
        surface_set_target(WinSurface)
            draw_clear_alpha(c_black,0)
            
            draw_set_color(c_green)
            
            draw_rectangle(WinX-2,WinY-2,
            2+WinX+surface_get_width(MapSurface)*MapSize,
            2+WinY+surface_get_height(MapSurface)*MapSize
            ,1
            )
             draw_set_color(c_white)
             
           draw_surface_ext(BGSurface,WinX,WinY,MapSize,MapSize,0,c_white,1)  
           draw_surface_ext(MapSurface,WinX,WinY,MapSize,MapSize,0,c_white,1)
           draw_surface_ext(LinkSurface,WinX,WinY,MapSize,MapSize,0,c_white,1)
           
            //draw_surface_part(MapSurface,128,128,128,128,WinX,WinY)
            
        surface_reset_target()
} //窗口窗口

        draw_surface(WinSurface,(1280 - 800)/2,128)
    }

Button = 0;
Button[0] = "修改名称"
Button[1] = "修改描述"
Button[2] = "修改封面"
Button[3] = "上传Steam"
Button[4] = "清空地图"
Button[5] = "删除地图"
Button[6] = "修改地图尺寸"
Button[7] = "退出"
    draw_set_font(fText)
  var Size =  array_length_1d(Button)
  for (var i = 0; i < Size; ++i) {
      
      
      var str =string(Button[i])
      
      var h = string_height(str)
      
      if i = MeunSelect 
      draw_set_color(c_red)
      else
      draw_set_color(c_white)
      
      
        draw_text(0   ,i*h + GameInfo.Height - Size *h ,str)
   }
   
//调整选项
if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)
{
    if keyboard_check_pressed(vk_up) MeunSelect--;
    if keyboard_check_pressed(vk_down) MeunSelect++;
    
    MeunSelect = min(MeunSelect,array_length_1d(Button)-1)
    MeunSelect = max(0,MeunSelect)
}   

//调整方向
if keyboard_check_pressed(vk_anykey)
{
    if keyboard_key = ord("W") PenAngle = 2
    
    if keyboard_key = ord("S") PenAngle = 6
    
    if keyboard_key = ord("A") PenAngle = 4
    
    if keyboard_key = ord("D") PenAngle = 8
    
    if keyboard_key = ord("Q") PenSelect -= 1
    if keyboard_key = ord("E") PenSelect += 1
    
}

//添加 
if mouse_check_button(mb_left)
{
    if  ds_grid_get(MapGrid,GridX,GridY) = 0
    {
        ds_grid_set(MapGrid,GridX,GridY,  PenAngle) 
   event_user(0)
    }
}
// 清除 
if mouse_check_button(mb_right)
{
    if  ds_grid_get(MapGrid,GridX,GridY) != 0
    {
         ds_grid_set(MapGrid,GridX,GridY,0) 
   event_user(0)
    }
}

//菜单指令
if keyboard_check_pressed(ord("Z"))
{

    switch (MeunSelect) {
         case 0:
       get_string("填写名称","")
        break;
         case 1:
       get_string("填写描述","描述")
        break;
          case 2:
       get_open_filename("*","*")
        break;
          case 3:
       get_string("填写更新描述","描述")
        break;
          case 4:
        {
             for(var a = 0;a< ds_grid_width(MapGrid);a++)
                {
                   for(var b = 0;b< ds_grid_height(MapGrid);b++)
                   {
                       MapGrid[#a,b] = 0
                   }
                }
                event_user(0)
        }
       
        break;
          case 5:
      
        break;
           case 6:
       get_integer("地图宽度",800)
       get_integer("地图高度",450)
        break;
    case 7:
       room_goto(rMeun)
        break;
    default:
        // code here
        break;
}


}


#region 绘制 编辑的区域 
draw_set_color(c_red)
var OldAlp = draw_get_alpha()
draw_set_alpha(1)
var X = (1280 - 800)/2;
var Y = 128;
var W = 800;
var H = 450;
draw_rectangle(X,Y,X+W,Y+H,1)
draw_set_alpha(OldAlp)
#endregion