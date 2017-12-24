//var OldPart = pPart //过去的选项
//var ListNO = ds_list_size(List) //列表的数量


 #region 打开地图 和新建地图 返回上级菜单

#region 调试选项部分
#region 调整Part的选中
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 

	//刷
Map[?"选中"] = false;
	//覆盖

var map =  MeunButton[Select]
map[?"选中"] = true;


}
#endregion
#region //鼠标修改 选中
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 
	if device_mouse_x_to_gui(0) > Map[?"X"] and device_mouse_x_to_gui(0) < Map[?"X"] +Map[?"W"]
and device_mouse_y_to_gui(0) > Map[?"Y"] and device_mouse_y_to_gui(0) < Map[?"Y"] +Map[?"H"]
and oGame.MouseUse
{
	Map[?"选中"] = true;
	Map[?"触碰"] = true;
	Select = i
}
else
{
	Map[?"触碰"] = false;
}
}
	#endregion

	#region  手柄键盘输入 调整Part的选中
	if KeyCheck("上",0)
	Select--
	
	if KeyCheck("下",0)
	Select++
	#endregion
	
	#region 选中 范围修正
	Select = max(Select,0)
	Select = min(Select,array_length_1d(MeunButton)-1)
	
	#endregion
	

#endregion

#region 触发执行部分
		#region 选中+确定触发
		var Map =  MeunButton[Select] 
	if KeyCheck("确定",0) or (oGame.MouseUse and mouse_check_button_pressed(mb_left) and Map[?"触碰"])
	{
		
		switch (Select) {
			
			case 2://删除
			//删除文件
			directory_destroy("本地地图/"+string(ds_list_find_value(List,Part)))
			//删除列表
			ds_list_delete(List,Part)
			
			if !ds_list_size(List)
		Instance_Change(oTitleMeun,0)
			break;
			
			  case 3 ://返回
			Instance_Change(oTitleMeun,0)
				   break;
				   
			  case 1 ://新建
		CreateNewMap()
				break;
				   
		    default:

		        break;
		}
		
	}
	#endregion


	#endregion

#endregion


#region 左右调整
if KeyCheck("左",0)
Part --;
if KeyCheck("右",0)
Part ++;

if KeyCheck("左",0) or KeyCheck("右",0)
{
	var PartMax = ds_list_size(List)-1
	Part = max(Part,0)
	Part = min(Part,PartMax)
	//重新填装
var file = "本地地图/"+string(List[|Part])
ini_open(file+"/Map.ini")
if ini_section_exists("地图信息")
if ini_key_exists("地图信息","基本信息")
{
MapInfo = ds_map_create()
ds_map_read(MapInfo,ini_read_string("地图信息","基本信息",""))
surface_free(CoverSuf)
}
	
}
#endregion


