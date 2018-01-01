/// @description 
#region 绘制游戏背景
	gpu_set_texfilter(true)
   var Size = 1280/sprite_get_width(sTitleBG)
	draw_sprite_ext(sTitleBG,0,0,0,Size,Size,0,c_white,1)
	draw_set_color(c_black)
	draw_set_alpha(0.7)
	draw_rectangle(0,0,1280,720,0)
gpu_set_texfilter(false)
#endregion


#region 绘制按钮
//draw_set_font(fText)
//draw_set_color(c_white)
//var Key = ds_map_find_first(Var引索)

//var N = 0
//for (var i = 0; i < ds_map_size(Var引索);i++) {
//if Key != undefined
//if string_pos("按钮", Key) != 0
//{		var List = Var引索[?Key]
//	 draw_text(N*128,0,Key)
//	 draw_set_halign(0)
//	  draw_set_valign(0)
//		for (var a = 0; a < ds_list_size(List); ++a) {
//			var Map = List[|a]
//		    draw_text(N*128,128+a*Map[?"H"],Map[?"Str"])
			
//		}
//		N++
//}
//	Key = ds_map_find_next(Var引索,Key)
//}
#endregion


#region 绘制编辑窗口
//event_user(2)
var Map = variable_instance_get(id,"编辑区域")
draw_set_alpha(1)
draw_surface(Map[?"编辑窗口表面"],Map[?"编辑窗口X"],Map[?"编辑窗口Y"])
draw_set_color(c_white)
draw_set_alpha(0.5)
draw_rectangle(Map[?"编辑窗口X"]-1,Map[?"编辑窗口Y"]-1,Map[?"编辑窗口X"]+Map[?"编辑窗口W"]+1,Map[?"编辑窗口Y"]+Map[?"编辑窗口H"]+1,1)
draw_set_alpha(1)
#endregion

#region 按钮部分
#region Top按钮
draw_set_font(fText)
var Name = "Top按钮"
var List = variable_instance_get(id,Name)
var X = 0
var Y = 0
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,0,Map[?"W"],Map[?"H"])
		{
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,0,Map[?"W"]+X,Map[?"H"],1)
		}
		
		draw_text(X,Y,Map[?"Str"])
				X+= Map[?"W"]
				
#endregion
	}
		
		#endregion
	
#region 方向按钮
draw_set_font(fText)
var Name = "方向按钮"
var List = variable_instance_get(id,Name)
var X = 480
var Y = 570
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,Y,Map[?"W"],Map[?"H"])
		{
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,Y,Map[?"W"]+X,Map[?"H"]+Y,1)
		}
		
		draw_text(X,Y,Map[?"Str"])
			
				
#endregion
			X+= Map[?"W"]
	}
#endregion

#region 视野按钮
draw_set_font(fText)
var Name = "视野按钮"
var List = variable_instance_get(id,Name)
var X = 485
var Y = 90
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,Y,Map[?"W"],Map[?"H"])
		{
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,Y,Map[?"W"]+X,Map[?"H"]+Y,1)
		}
		
		draw_text(X,Y,Map[?"Str"])
			
				
#endregion
			X+= Map[?"W"]
	}
#endregion

#region 力度按钮
draw_set_font(fText)
var Name = "力度按钮"
var List = variable_instance_get(id,Name)
var X = 480
var Y = 624
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,Y,Map[?"W"],Map[?"H"])
		{
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,Y,Map[?"W"]+X,Map[?"H"]+Y,1)
		}
		
		draw_text(X,Y,Map[?"Str"])
			
				
#endregion
			X+= Map[?"W"]
	}
#endregion

#region 分类按钮
draw_set_font(fText)
var Name = "分类按钮"
var List = variable_instance_get(id,Name)
var X = 0
var Y = 90
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,Y,Map[?"W"],Map[?"H"])
		{
			
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,Y,Map[?"W"]+X,Map[?"H"]+Y,1)
		}
		
		draw_text(X,Y,Map[?"Str"])
			
				
#endregion
			X+= Map[?"W"]
	}
#endregion

#region 笔刷按钮
draw_set_font(fText)
var Name = "编辑区域"
var Map = variable_instance_get(id,Name)
var Name = Map[?"笔刷分类"]+"笔刷按钮"
var List = variable_instance_get(id,string(Map[?"笔刷分类"])+"笔刷按钮")
var X = 0
var Y = 128
	for (var i = 0; i <ds_list_size(List);  ++i) {
		var Map = List[|i]
		var H = Map[?"H"]
		#region 检测相关
		Map[?"触碰"] = false
		if MouseGetGui(X,Y,Map[?"W"],Map[?"H"])
		{
			Map[?"触碰"] = true
			if mouse_check_button_pressed(mb_left)
			{
				ButtonUse(Name,Map[?"引索"])
			}
		}
		#endregion
		#region 绘制相关
			if Map[?"触碰"]
		{
		draw_rectangle(X,Y,Map[?"W"]+X,Map[?"H"]+Y,1)
		}
		
		draw_text(X,Y,Map[?"Str"])
			
				
#endregion
			Y+= Map[?"H"]
	}
#endregion
#endregion

Map = variable_instance_get(id,"编辑区域")
	   #region 绘制鼠标
	var a = mouse_x
	var b = mouse_y
	var xx;
	var yy;
	var Arg;
	var Spr;
	Arg = Map[?"笔刷角度"]
	Spr = GetIndex("s"+ Map[?"笔刷名称"],asset_sprite)
	
	switch (Arg) {
	    case 0:
	      xx = 0
		  yy = 0
	        break;
			
			 case 90:
	      xx = 0
		  yy = 0 -32
	        break;
			
			 case 180:
	      xx = 0 -32
		  yy = 0 - 32
	        break;
			
			 case 270:
	      xx = 0 -32
		  yy =0
	        break;
	  
	}
	
	draw_sprite_ext(Spr,0,(a)-xx ,(b)-yy,1,1,Arg,c_white,1)
	

	   #endregion

#region Debug内容
draw_set_font(fDebug)

//var MapInfo = variable_instance_get(id,"编辑区域")
//var Key = ds_map_find_first(MapInfo)
//for (var i = 0; i < ds_map_size(MapInfo) ;++i) {
//	draw_text(0,i*string_height("Guuan"),string(Key)+" : "+string(ds_map_find_value(MapInfo,Key)))
//	Key = ds_map_find_next(MapInfo,Key)
//    // code here
//}
#endregion
