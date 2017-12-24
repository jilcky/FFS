/// @description 这里绘制底部背景
if room = rTitle
{	var size = 1280/1920;
	draw_sprite_ext(sTitleBG,0,0,0,size,size,0,c_white,1)
	draw_set_color(c_black)
	draw_set_alpha(0.6)
	draw_rectangle(0,0,1280,720,0)
	draw_set_alpha(1)
	
	draw_set_color(c_white)
}