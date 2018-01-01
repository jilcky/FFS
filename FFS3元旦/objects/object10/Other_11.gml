/// @description 刷新物品摆放表面的

	var MapInfo = variable_instance_get(id,"编辑区域")
		surface_set_target(  MapInfo[?"物品摆放表面"])
		
		
		draw_set_alpha(1)
			   var Width = MapInfo[?"物品摆放W"];
	   var Height = MapInfo[?"物品摆放H"];
	   #region 绘制网格线条


	
		draw_clear_alpha(c_white,0)
		draw_set_alpha(1)
		draw_set_color(c_white)
		var Size = 2 
		//画竖的线
		for (var a = 0; a < Height div 32*Size +1; ++a) {
			
		  draw_line (32*Size*a,0,32*Size*a,Height)
		   draw_line (32*Size*a+1,0,32*Size*a+1,Height)
		//  draw_text(32*Size*a,0,32*Size*a)
		}
		
		  	for (var b = 0; b < Width div 32*Size +1; ++b) {
			draw_line (0,b*32*Size+1,Width,b*32*Size+1)
			draw_line (0,b*32*Size,Width,b*32*Size)
		//	draw_text(0,b*32*Size,b*32*Size)
		}

	   #endregion
	   var MapGrid = MapInfo[?"储存表格"]
	   		for (var a = 0; a < ds_grid_width(MapGrid); ++a) {
//			draw_text(a*32,0,a)
			   for (var b = 0; b < ds_grid_height(MapGrid); ++b) {
				   var Map = ds_grid_get(MapGrid,a,b)
			       if Map{
	   #region 刷新物资

	var xx;
	var yy;
	var Arg;
	var Spr;
	Arg = Map[?"角度"]
	Spr = GetIndex("s"+ Map[?"名称"],asset_sprite)
	
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
	
	draw_sprite_ext(Spr,0,(a)*32-xx ,(b)*32-yy,1,1,Arg,c_white,1)
	

	   #endregion
				   }
	   }}
	   
	   		surface_reset_target()