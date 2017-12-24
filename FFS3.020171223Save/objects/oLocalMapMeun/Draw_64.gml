/// @description 

	#region 菜单
		draw_set_font(fTitle)
		draw_set_halign(0)
		draw_set_color(c_white)
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
	
	
	#region 地图预览
		var size = 1280/1920
	#region 预览图像

	var xx = (200 *size)div 2*2
	var yy = (249*size) div 2*2
	var w = (800*size) div 2*2
	var h =  (450*size) div 2*2
	//draw_rectangle(xx,yy,xx+w,yy+h,0)

if !surface_exists(CoverSuf){
var ID = MapInfo[?"LocalID"]
var file = "本地地图/"+string(ID)
var Cover = sprite_add(string(file)+"/封面.png",1,0,0,0,0)
CoverSuf = surface_create(1280,720)
surface_set_target(CoverSuf)
draw_sprite(Cover,1,0,0)
surface_reset_target()
}
else
{
draw_surface_stretched(CoverSuf,xx,yy,w,h)
}


	draw_set_color(c_black)
	//draw_text(xx+128,yy+128,Part)
	#endregion
	#region 预览标题
	var xx = (1567*size) div 2 *2
	var yy = (200*size) div 2*2
	draw_set_font(fTitle)
	draw_set_halign(1)
	draw_set_valign(0)
	draw_set_color(c_white)
	draw_text(xx,yy,MapInfo[?"名称"])
	
	#endregion
	#region 预览描述
	#endregion
	
	
	#endregion
	
	