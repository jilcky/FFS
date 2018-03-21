/// @description 处理按钮反馈

show_debug_message("房间:"+string(room_get_name(room))+"__执行ID:"+string( ButtonID)+"__指令:"+string(ButtonOrder))

#region 修改指令(临时不用)
/*
 ini_open("记录.ini")
for (var i = 0; i < array_length_1d(Button); ++i) {
  if ButtonID = Button[i]
  {		var Str = ""
		Str = get_string("","指令")
		if Str!=""
		ini_write_string(i,"指令",Str)
  }
}




ini_close()
*/
#endregion


#region 主菜单 指令处理
if room = room3{
		if instance_exists(Vertical_Drawing)
if  ButtonID = Vertical_Drawing
{
	with(Vertical_Drawing){
	TweenFire(id, EaseOutCubic, 1, true, 0.0, 0.1,"y", 288-32,288);    
	}
}
		//做一个计时器
		RetunButtonOrder = TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"x",x,x);
		TweenAddCallbackUser(RetunButtonOrder, TWEEN_EV_FINISH, id, 1);
		
		//回到原位
        with(oMeunButton)
		{
		TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"x",x,CX);
		TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"y",y,CY);
		}
		
		
}
#endregion

#region 用户信息
if room = room4
{
	RetunButtonOrder = TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.5 ,"x",x,x);
	TweenAddCallbackUser(RetunButtonOrder, TWEEN_EV_FINISH, id, 1);
}
#endregion
