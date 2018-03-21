/// @description Insert description here
// You can write your code in this editor
if room  = room3
{
#region 按钮
ini_open("记录.ini")

for (var i = 0; i < ini_read_real("Info","ID",0); ++i) {
	if ini_section_exists(i) and ini_read_real(i,"sprite_index",-1)!=-1
		{
		Button[i] = instance_create_depth(x,y,0,oMeunButton)
		var sp = ini_read_real(i,"sprite_index",-1)
		var X = ini_read_real(i,"x",-1) 
		var Y = ini_read_real(i,"y",-1)
		var CX = ini_read_real(i,"Cx",-1)
		var CY = ini_read_real(i,"Cy",-1)
		
		var ID = Button[i]
		ID.sprite_index = sp
		ID.mask_index = sp
		ID.CX = CX;
		ID.CY = CY;
		TweenFire(ID, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"x",CX,X);
		TweenFire(ID, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"y",CY,Y);
		
		//if ini_key_exists(i,"指令")
		ID.ButtonOrder = ini_read_string(i,"指令","")
		}
}
	
ini_close()
	

#endregion
#region 立绘
	Vertical_Drawing = instance_create_depth(x,y,0,oMeunButton)
	X = 244 
	Y = 288
	var ID = Vertical_Drawing
	var sp = ___18
		ID.sprite_index = sp
		ID.mask_index = sp
	
	CX = -sprite_get_height(ID.sprite_index)
	CY = Y
	ID.CX = CX;
	ID.CY = CY;
	TweenFire(ID, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"x",CY,X);
	TweenFire(ID , EaseInOutQuad, TWEEN_MODE_PATROL, true, 0.0, 3 ,"y",CY,Y-64);   
	
#endregion
}