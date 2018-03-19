/// @description 


#region 绘制背景
	gpu_set_texfilter(true)
   var Size = 1280/sprite_get_width(FakeSuperSonia)
	draw_sprite_ext(FakeSuperSonia,0,0,0,Size,Size,0,c_white,1)
	//draw_set_color(c_black)
	//draw_set_alpha(0.7)
	//draw_rectangle(0,0,1280,720,0)
gpu_set_texfilter(false)

#endregion

#region 绘制游戏窗口
gpu_set_texrepeat(false)
draw_set_alpha(1)
if surface_exists( GameSuf)
   {
   draw_surface_stretched( GameSuf, GameSufX, GameSufY ,GameSufW, GameSufH);
   draw_set_color(c_white)
   draw_rectangle(GameSufX,GameSufY,GameSufW+GameSufX,GameSufH+GameSufY,1)
   }

   
#endregion

#region 顶部按钮
draw_set_color(c_white)
draw_set_font(fontButton)
for (var i = 0; i < ds_list_size(TopButtonList); ++i) {
	var Map = TopButtonList[|i]
var	xx = Map[?"X"]+1280-TopButtonWidth
var	yy = Map[?"Y"]
var 	str = Map[?"Str"]
var w = Map[?"W"]
var h = Map[?"H"]
    draw_text(xx,yy,str)
	draw_rectangle(xx,yy,xx+w,yy+h,1)
}
var Map = TopButtonList[|0]
var	xx = Map[?"X"]+1280-TopButtonWidth
var	yy = Map[?"Y"]
	draw_rectangle(xx,yy,xx+TopButtonWidth,yy+h,1)
#endregion

#region 图层按钮
	for (var i = 0; i < ds_list_size(LayerButtonList); ++i) {
var Map = LayerButtonList[|i]
var w = Map[?"W"] 
var h = Map[?"H"]
var	xx = Map[?"X"] + GameSufX - w
var	yy = Map[?"Y"] + GameSufY 
var 	str = Map[?"Str"]

    draw_text(xx,yy,str)
	draw_rectangle(xx,yy,xx+w,yy+h,1)
	
	}
#endregion

#region 笔刷按钮
	var Str = ""
	switch (Layer) {
	    case 0 :
	       Str = "墙体"
	        break;
			   case 1 :
	       Str = "玩家"
	        break;
			   case 2 :
	       Str = "协助"
	        break;
			   case 3 :
	       Str = "威胁"
	        break;
	    default:
	        // code here
	        break;
	}
	var Map = PenMap[?Str]
	var MapKey = ds_map_find_first(Map)
	for (var i = 0; i < ds_map_size(Map); ++i) {
		var xx = 0;
		var yy= 128 + i*string_height(MapKey)
		draw_text(xx,yy,MapKey)
		MapKey = ds_map_find_next(Map,MapKey)
	}
#endregion

