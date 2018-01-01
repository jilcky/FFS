#region 编辑区域
var MapInfo = variable_instance_get(id,"编辑区域")
if MouseGetGui(MapInfo[?"编辑窗口X"],MapInfo[?"编辑窗口Y"],MapInfo[?"编辑窗口W"],MapInfo[?"编辑窗口H"])


{
#region 获取 编辑窗口鼠标相对位置
var Var  = device_mouse_x_to_gui(0) - MapInfo[?"编辑窗口X"]
Var = max(Var,0)
Var = min(Var,MapInfo[?"编辑窗口W"])
MapInfo[?"编辑窗口鼠标相对位置X"] = Var

var Var  = device_mouse_y_to_gui(0) - MapInfo[?"编辑窗口Y"]
Var = max(Var,0)
Var = min(Var,MapInfo[?"编辑窗口H"])
MapInfo[?"编辑窗口鼠标相对位置Y"] = Var

#endregion

#region 计算相对位置
var W = MapInfo[?"摄像头W"]
var Var = MapInfo[?"摄像头X"]+(W)*(MapInfo[?"编辑窗口鼠标相对位置X"]/MapInfo[?"编辑窗口W"])
//Var  = Var div 32 *32
MapInfo[?"物品摆放鼠标相对X"] = Var

var H = MapInfo[?"摄像头H"]
var Var = MapInfo[?"摄像头Y"]+(H)*(MapInfo[?"编辑窗口鼠标相对位置Y"]/MapInfo[?"编辑窗口H"])
//Var  = Var div 32 *32
MapInfo[?"物品摆放鼠标相对Y"] = Var

#endregion

#region 调整视野(目前只有大小)

if mouse_wheel_up()
{
var Var = MapInfo[?"摄像头W"]-MapInfo[?"物品摆放W"]*0.1

MapInfo[?"摄像头W"] =Var

var Var = MapInfo[?"摄像头H"]-MapInfo[?"物品摆放H"]*0.1

MapInfo[?"摄像头H"] =Var
}

if mouse_wheel_down()
{
var Var = MapInfo[?"摄像头W"]+MapInfo[?"物品摆放W"]*0.1

MapInfo[?"摄像头W"] =Var

var Var = MapInfo[?"摄像头H"]+MapInfo[?"物品摆放H"]*0.1

MapInfo[?"摄像头H"] =Var
}

if mouse_wheel_down() or mouse_wheel_up()
{
	MapInfo[?"摄像头W"] = min(MapInfo[?"物品摆放W"]*1,MapInfo[?"摄像头W"] )
	MapInfo[?"摄像头W"] = max(MapInfo[?"物品摆放W"]*0.1,MapInfo[?"摄像头W"] )
	
	MapInfo[?"摄像头H"] = min(MapInfo[?"物品摆放H"]*1,MapInfo[?"摄像头H"] )
	MapInfo[?"摄像头H"] = max(MapInfo[?"物品摆放H"]*0.1,MapInfo[?"摄像头H"] )
	event_user(2)
}
#endregion

#region 确认摆放
if mouse_check_button(mb_left)
{
	var X = 	MapInfo[?"物品摆放鼠标相对X"]  div 32;
	var Y =   MapInfo[?"物品摆放鼠标相对Y"]  div 32;
	
	if !ds_grid_get(MapInfo[?"储存表格"],X,Y){
	ds_grid_set(MapInfo[?"储存表格"],X,Y,Ds_Map_Create())
	var Map2 = ds_grid_get(MapInfo[?"储存表格"],X,Y)
 ds_map_add(Map2,"名称",MapInfo[?"笔刷名称"])
ds_map_add(Map2,"角度",MapInfo[?"笔刷角度"])
 ds_map_add(Map2,"力度",MapInfo[?"笔刷力度"])
  ds_map_add(Map2,"X",X)
    ds_map_add(Map2,"Y",Y)
		event_user(1)
		event_user(2)
	}

}
//这里是清理
if mouse_check_button(mb_right)
{
	var X = 	MapInfo[?"物品摆放鼠标相对X"]  div 32;
	var Y =   MapInfo[?"物品摆放鼠标相对Y"]  div 32;
	
	if ds_grid_get(MapInfo[?"储存表格"],X,Y){
		ds_map_destroy(ds_grid_get(MapInfo[?"储存表格"],X,Y))
	ds_grid_set(MapInfo[?"储存表格"],X,Y,0)
	event_user(1)
event_user(2)
	
	}

}

#endregion



}#endregion