/// @description 反馈动画结束进行执行
#region 主菜单
if room = room3{
switch (ButtonOrder) {
    case "用户信息":
      room_goto(room4)
        break;
    default:
        // code here
        break;
}
}

#endregion

if room = room4
{
	switch (ButtonOrder) {
    case "返回":
      room_goto(RoomBack)
        break;
    default:
        // code here
        break;
}
}