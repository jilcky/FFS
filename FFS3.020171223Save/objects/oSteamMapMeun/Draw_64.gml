/// @description 

	#region 展示菜单 与预览
		draw_set_font(fTitle)
for (var i = 0; i < array_length_1d(Meun); ++i) {
var Map =  MeunButton[i] 

//绘制左边的菜单
if Map[?"选中"] = true
//draw_set_color(c_red)
//else
//draw_set_color(c_white)

draw_rectangle(Map[?"X"],Map[?"Y"],Map[?"X"]+Map[?"W"],Map[?"Y"]+Map[?"H"],true)
draw_text(Map[?"X"],Map[?"Y"],Meun[i])
}


        // code here
	#endregion

//steam_list = ds_list_create(); 
//steam_ugc_get_subscribed_items(steam_list);
//numSub = steam_ugc_num_subscribed_items();

