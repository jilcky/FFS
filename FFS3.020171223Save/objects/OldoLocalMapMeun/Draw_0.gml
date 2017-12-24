/// @description 

switch (MeunMode) {
    case "List":
	#region 展示菜单 与预览
		draw_set_font(fTitle)
for (var i = 0; i < array_length_1d(Meun); ++i) {
var Map =  MeunButton[i] 

//绘制左边的菜单
if Map[?"选中"] = true
draw_set_color(c_red)
else
draw_set_color(c_white)

draw_rectangle(Map[?"X"],Map[?"Y"],Map[?"X"]+Map[?"W"],Map[?"Y"]+Map[?"H"],true)
draw_text(Map[?"X"],Map[?"Y"],Meun[i])
}


        // code here
	#endregion
        break;
	case "Meun":
		#region 编辑菜单按钮
		draw_set_font(fTitle)
for (var i = 0; i < array_length_1d(Meun2); ++i) {
var Map =  MeunButton2[i] 

//绘制左边的菜单
if Map[?"选中"] = true
draw_set_color(c_red)
else
draw_set_color(c_white)

draw_rectangle(Map[?"X"],Map[?"Y"],Map[?"X"]+Map[?"W"],Map[?"Y"]+Map[?"H"],true)
draw_text(Map[?"X"],Map[?"Y"],Meun2[i])
}


        // code here
	#endregion
	break;
    default:
        // code here
        break;
}
/*
var ID = ds_list_find_value(oGame.LocalMapIDList,Select-1+Part)
var Name = oGame.LocalMapNameMap[?ID]
if (Select!=0 or Select!=array_length_1d(Meun))and
 ds_map_exists( oGame.LocalMapNameMap,ID)
 or MeunMode = "Meun"
{
#region 展示右下角
draw_set_font(fText)
draw_set_color(c_white)
var Key = ds_map_find_first(oGame.MapInfo)
var Size = ds_map_size(oGame.MapInfo)
for (var i = 0; i < Size; ++i) {
	
	var Str = string(Key)+":" +  string(ds_map_find_value(oGame.MapInfo,Key))
	var W = string_width(string(Str))
	var H = string_height(string(Str))
    draw_text(1280-W,720-Size*(H)+i*H, string(Str))
	Key = ds_map_find_next(oGame.MapInfo,Key)
}
 #endregion
}