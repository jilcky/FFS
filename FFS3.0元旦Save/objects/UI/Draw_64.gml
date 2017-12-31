/// @description 


#region 游戏编辑窗口

#region 绘制背景
	gpu_set_texfilter(true)
   var Size = 1280/sprite_get_width(sTitleBG)
	draw_sprite_ext(sTitleBG,0,0,0,Size,Size,0,c_white,1)
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
#endregion




#region 地图信息
	var key  = ds_map_find_first(MapInfo)
	for (var i = 0; i < ds_map_size(MapInfo); ++i) {
		draw_set_font(fText)
		var str = string(key)+":"+string(ds_map_find_value(MapInfo,key))
		var xx = 1280
		var yy = GameSufY+GameSufH+string_height(str)*i
		draw_set_color(c_white)
	draw_set_halign(2)
	draw_set_valign(0)
		draw_text(xx,yy,str)
	  key = ds_map_find_next(MapInfo,key)
	  
	}
#endregion


#region 按钮
draw_set_font(fTitle)
	
#region TopButtonSuf
if surface_exists(TopButtonSuf ) 
{
	draw_surface(TopButtonSuf,TopButtonX,TopButtonY)
	#region 绘制选中
if MouseGetGui(TopButtonX,TopButtonY,TopButtonWidth,TopButtonHeight)
{
for (var i = 0; i < array_length_1d(TopButton); ++i) {
	var xx = (TopButton_w+8)*i + TopButton_w/2   + TopButtonX
	var yy = TopButtonY
	//draw_rectangle(xx-TopButton_w/2,yy,xx+TopButton_w/2 ,yy+TopButton_h,true)
	if MouseGetGui(xx-TopButton_w/2,yy,TopButton_w,TopButton_h)
	{
		draw_set_halign(1)
	draw_set_valign(1)
		draw_set_color(c_gray)
	draw_rectangle(xx-TopButton_w/2,yy,xx+TopButton_w/2 ,yy+TopButton_h,false)
		var yy = yy+16
		draw_set_color(c_white)
			var str = TopButton[i]
	draw_text(xx,yy,str)
	}
}

}
#endregion
	}
else
{

	#region 构建底部
	TopButtonSuf = 	surface_create(TopButtonWidth,TopButtonHeight)
surface_set_target(TopButtonSuf)

draw_set_halign(1)
draw_set_valign(1)


for (var i = 0; i < array_length_1d(TopButton); ++i) {
	var xx = (TopButton_w+8)*i + TopButton_w/2   //+320

	var str = TopButton[i]
	var yy = 0//TopButtonY
	draw_set_color(c_black)
	draw_rectangle(xx-TopButton_w/2,yy,xx+TopButton_w/2 ,yy+TopButton_h,false)
	var yy = 16
	draw_set_color(c_white)
	draw_text(xx,yy,str)
	
}
surface_reset_target()

	#endregion

}

#endregion

#region PenSelectButtonSuf
if surface_exists(PenSelectButtonSuf ) 
{
	draw_surface(PenSelectButtonSuf,PenSelectButtonX,PenSelectButtonY)
	#region 绘制选中
if MouseGetGui(PenSelectButtonX,PenSelectButtonY,PenSelectButtonWidth,PenSelectButtonHeight)
{
for (var i = 0; i < array_length_1d(PenSelectButton); ++i) {
	var xx = (PenSelectButton_w+8)*i + PenSelectButton_w/2   + PenSelectButtonX
	var yy = PenSelectButtonY
	//draw_rectangle(xx-PenSelectButton_w/2,yy,xx+PenSelectButton_w/2 ,yy+PenSelectButton_h,true)
	if MouseGetGui(xx-PenSelectButton_w/2,yy,PenSelectButton_w,PenSelectButton_h)
	{
		draw_set_halign(1)
	draw_set_valign(1)
		draw_set_color(c_gray)
	draw_rectangle(xx-PenSelectButton_w/2,yy,xx+PenSelectButton_w/2 ,yy+PenSelectButton_h,false)
		var yy = yy+16
		draw_set_color(c_white)
			var str = PenSelectButton[i]
	draw_text(xx,yy,str)
	}
}

}
#endregion
	}
else
{

	#region 构建底部
	PenSelectButtonSuf = 	surface_create(PenSelectButtonWidth,PenSelectButtonHeight)
surface_set_target(PenSelectButtonSuf)

draw_set_halign(1)
draw_set_valign(1)


for (var i = 0; i < array_length_1d(PenSelectButton); ++i) {
	var xx = (PenSelectButton_w+8)*i + PenSelectButton_w/2   //+320

	var str = PenSelectButton[i]
	var yy = 0//PenSelectButtonY
	draw_set_color(c_black)
	draw_rectangle(xx-PenSelectButton_w/2,yy,xx+PenSelectButton_w/2 ,yy+PenSelectButton_h,false)
	var yy = 16
	draw_set_color(c_white)
	draw_text(xx,yy,str)
	
}
surface_reset_target()

	#endregion

}

#endregion

#region ArgButtonSuf
if surface_exists(ArgButtonSuf ) 
{
	draw_surface(ArgButtonSuf,ArgButtonX,ArgButtonY)
	#region 绘制选中
if MouseGetGui(ArgButtonX,ArgButtonY,ArgButtonWidth,ArgButtonHeight)
{
for (var i = 0; i < array_length_1d(ArgButton); ++i) {
	var xx = ArgButtonX + ArgButton_w/2 //+ (ArgButton_w)//+8)*i + ArgButton_w/2   +
	var yy = ArgButtonY+ (ArgButton_h+8)*i
	//draw_rectangle(xx-ArgButton_w/2,yy,xx+ArgButton_w/2 ,yy+ArgButton_h,true)
	if MouseGetGui(xx-ArgButton_w/2,yy,ArgButton_w,ArgButton_h)
	{
		draw_set_halign(1)
	draw_set_valign(1)
		draw_set_color(c_gray)
	draw_rectangle(xx-ArgButton_w/2,yy,xx+ArgButton_w/2 ,yy+ArgButton_h,false)
		var yy = yy+16
		draw_set_color(c_white)
			var str = ArgButton[i]
	draw_text(xx,yy,str)
	#region 展开描述
	var xx =  device_mouse_x_to_gui(0) div 16 *16 + 128
	var yy =  device_mouse_y_to_gui(0) div 16 * 16
	var w = 320
	var h = 320
	
	//draw_rectangle(xx,yy,xx+w,yy+h,0)
	#endregion
	}
}

}
#endregion
	}
else
{

	#region 构建底部
	ArgButtonSuf = 	surface_create(ArgButtonWidth,ArgButtonHeight)
surface_set_target(ArgButtonSuf)

draw_set_halign(1)
draw_set_valign(1)


for (var i = 0; i < array_length_1d(ArgButton); ++i) {
	var xx = ArgButton_w/2// (ArgButton_w+16)*i +    //+320

	var str = ArgButton[i]
	var yy = 0+(ArgButton_h+8)*i//ArgButtonY
	draw_set_color(c_black)
	draw_rectangle(xx-ArgButton_w/2,yy,xx+ArgButton_w/2 ,yy+ArgButton_h,false)
	var yy =yy+ 16
	draw_set_color(c_white)
	draw_text(xx,yy,str)
	
}
surface_reset_target()

	#endregion

}

#endregion
#region PenButtonSuf
if surface_exists(PenButtonSuf ) 
{
	draw_surface(PenButtonSuf,PenButtonX,PenButtonY)
	#region 绘制选中
if MouseGetGui(PenButtonX,PenButtonY,PenButtonWidth,PenButtonHeight)
{
for (var i = 0; i < array_length_1d(PenButton); ++i) {
	var xx = PenButtonX + PenButton_w/2 //+ (PenButton_w)//+8)*i + PenButton_w/2   +
	var yy = PenButtonY+ (PenButton_h+8)*i
	//draw_rectangle(xx-PenButton_w/2,yy,xx+PenButton_w/2 ,yy+PenButton_h,true)
	if MouseGetGui(xx-PenButton_w/2,yy,PenButton_w,PenButton_h)
	{
		draw_set_halign(1)
	draw_set_valign(1)
		draw_set_color(c_gray)
	draw_rectangle(xx-PenButton_w/2,yy,xx+PenButton_w/2 ,yy+PenButton_h,false)
		var yy = yy+16
		draw_set_color(c_white)
			var str = PenButton[i]
	draw_text(xx,yy,str)
	#region 展开描述
	var xx =  device_mouse_x_to_gui(0) div 16 *16 + 128
	var yy =  device_mouse_y_to_gui(0) div 16 * 16
	var w = 320
	var h = 320
	
	draw_rectangle(xx,yy,xx+w,yy+h,0)
	#endregion
	}
}

}
#endregion
	}
else
{

	#region 构建底部
	PenButtonSuf = 	surface_create(PenButtonWidth,PenButtonHeight)
surface_set_target(PenButtonSuf)

draw_set_halign(1)
draw_set_valign(1)


for (var i = 0; i < array_length_1d(PenButton); ++i) {
	var xx = PenButton_w/2// (PenButton_w+16)*i +    //+320

	var str = PenButton[i]
	var yy = 0+(PenButton_h+8)*i//PenButtonY
	draw_set_color(c_black)
	draw_rectangle(xx-PenButton_w/2,yy,xx+PenButton_w/2 ,yy+PenButton_h,false)
	var yy =yy+ 16
	draw_set_color(c_white)
	draw_text(xx,yy,str)
	
}
surface_reset_target()

	#endregion

}

#endregion



#endregion

if true{
	draw_set_valign(0)
	draw_set_halign(0)
#region Debug内容
  draw_set_alpha(1)
  draw_set_color(c_white)
  draw_set_font(fDebug)
  var Meun;
Meun[0]  = "device_mouse_x_to_gui(0):"+string( device_mouse_x_to_gui(0))
Meun[1]  = "device_mouse_y_to_gui(0):"+string( device_mouse_y_to_gui(0))
Meun[2] = "GameSufMx:"+string(GameSufMx)+"    "+string(GameSufMx/GameSufW*100)+"%"
Meun[3] = "GameSufMy:"+string(GameSufMy)+"    "+string(GameSufMy/GameSufH*100)+"%"
Meun[4] = "camera_get_view_width():"+string(camera_get_view_width(view_camera[0]))
Meun[5] = "camera_get_view_height():"+string(camera_get_view_height(view_camera[0]))
Meun[6] = "Objx"+string(Objx)
Meun[7] = "Objy"+string(Objy)
Meun[6] = "Gridx"+string(Objx div 32)
Meun[7] = "Gridy"+string(Objy div 32)

	for (var i = 0; i < array_length_1d(Meun); ++i) {
		var Str = Meun[i]
		var h = string_height(Meun[i])
	 draw_text(0,32+i*h,Str)
	}
	
	if device_mouse_x_to_gui(0) - GameSufX > 0 and device_mouse_x_to_gui(0) - GameSufX < GameSufW
and device_mouse_y_to_gui(0) - GameSufY > 0 and device_mouse_y_to_gui(0) - GameSufY < GameSufH
{  draw_set_color(c_red)
	draw_rectangle(GameSufX,GameSufY,GameSufW+GameSufX,GameSufH+GameSufY,1)
}
//	var uploadMap = Ds_Map_Create();
//steam_ugc_get_item_update_progress(updateHandle, uploadMap);
//var statusCode = uploadMap[? "status_code"];
//var status = uploadMap[? "status_string"];
//var processed = uploadMap[? "bytes_processed"];
//var total = uploadMap[? "bytes_total"];
//draw_text(32, 0, "Upload info for item:" + string(updateHandle));
//draw_text(32, 15, "status code:" + string(statusCode));
//draw_text(32, 30, "status:" + string(status));
//draw_text(32, 45, "bytes processed:" +string(processed));
//draw_text(32, 60, "bytes total:" + string( total));
//ds_map_destroy(uploadMap);
	
	
#endregion/// @description 

}