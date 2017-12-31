/// @description 用于记录本地玩家编辑的地图

oGame.rTitleObject = self.object_index

#region 读取地图列表
ini_open("GameSetting.ini")
//当列表内容为0的时候记得删除
List = 	ds_list_create()
MaxID = ini_read_real("本地地图列表","最大ID",0)
if ini_key_exists("本地地图列表","List")
{
ds_list_read(List,ini_read_string("本地地图列表","List",""))
}
else
{
	global.LoadPart = 0
	CreateNewMap()
}
ini_close()
#endregion


#region 菜单按钮

Select = 0
OldSelect = Select

draw_set_font(fTitle)
//var Meun;
Meun = 0
 Meun[0] = MeunGetStr("编辑")
 Meun[1] = MeunGetStr("新建")
 Meun[2] = MeunGetStr("删除")
 Meun[3] = MeunGetStr("返回")



 
 MeunButton = 0
for (var i = 0; i < array_length_1d(Meun); ++i) {
	var H =  string_height(Meun[i] )
var h = 4
var W = string_width(Meun[i] )
 MeunButton[i] =   ButtonInfo(0,720-(array_length_1d(Meun)-i)*H+h,W,H)
}

#endregion

#region 地图

//左右调整启动的地图
Part = 0
if variable_global_exists("LoadPart")
Part = global.LoadPart
//装填第一个 地图信息的
if ds_list_find_value(List,Part)
var N = Part
else
var N = 0
var file = "本地地图/"+string(List[|N])
ini_open(file+"/Map.ini")
if ini_section_exists("地图信息")
if ini_key_exists("地图信息","基本信息")
{
MapInfo = Ds_Map_Create()
ds_map_read(MapInfo,ini_read_string("地图信息","基本信息",""))
}
CoverSuf  = -1
Cover = -1
#endregion
