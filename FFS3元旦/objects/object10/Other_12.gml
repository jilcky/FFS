/// @description 刷编辑窗口表面的

var MapInfo = variable_instance_get(id,"编辑区域")
		surface_set_target(  MapInfo[?"编辑窗口表面"])
		draw_clear_alpha(c_white,0)
		draw_set_alpha(1)
		draw_set_color(c_white)
		
		
var CamSize = (MapInfo[?"物品摆放W"]/ MapInfo[?"摄像头W"])

var CamSize2 = (MapInfo[?"物品摆放W"]/ MapInfo[?"摄像头W"])

draw_surface_stretched(MapInfo[?"物品摆放表面"],0,0,MapInfo[?"编辑窗口W"]*CamSize,MapInfo[?"编辑窗口H"]*CamSize)	
		
		surface_reset_target()