#region 按钮区域
#region 注册笔刷
PenAdd("Save","玩家")
PenAdd("End","玩家")
PenAdd("Player","玩家")

PenAdd("Block","墙体")
PenAdd("FadeBlock","墙体")
PenAdd("PingTai","墙体")

PenAdd("JumpBlock","协助")

PenAdd("JianChi","威胁")

#endregion

#region 按钮引索
#region Top按钮
var Name = "Top按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"保存","导入","导出","清空","上传","帮助","修改信息","进入试玩");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
  ds_map_add(Map,"引索",ds_list_find_value(List,i))
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#region "修改信息按钮"
var Name = "修改信息按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"修改名称","修改描述","修改封面");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#region "发射按钮"
var Name = "发射按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"更新描述","发送");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#endregion

#region 分类按钮
var Name = "分类按钮"
variable_instance_set(id,string(Name) ,Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"墙体","玩家","协助","威胁");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)

  ds_map_add(Map,"引索",ds_list_find_value(List,i))
  ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#region 方向按钮
var Name = "方向按钮"
variable_instance_set(id,string(Name) ,Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"上","下","左","右");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
  ds_map_add(Map,"Str",Str)
  ds_map_add(Map,"引索",ds_list_find_value(List,i))
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#region 力度按钮
var Name = "力度按钮"
variable_instance_set(id,string(Name) ,Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"减小","增加");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 ds_map_add(Map,"引索",ds_list_find_value(List,i))
  ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#region 笔刷按钮

var PenMap = variable_instance_get(id,"PenMap")
var AllPenMap = variable_instance_get(id,"AllPenMap")

var Key = ds_map_find_first(PenMap)
for (var a = 0; a < ds_map_size(PenMap); ++a) {
	 #region 笔刷按钮
var Name = string(Key)+"笔刷按钮"
variable_instance_set(id,string(Name) ,Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

var Map = ds_map_find_value(PenMap,Key)
var key = ds_map_find_first(Map)
for (var i = 0; i < ds_map_size(Map); ++i) {
//	show_debug_message(key)
		ds_list_add(List,key)
 key = ds_map_find_next(Map,key)
}

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
  ds_map_add(Map,"Str",Str)
 ds_map_add(Map,"引索",ds_list_find_value(List,i))
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion
 Key = ds_map_find_next(PenMap,Key)
}

#endregion

#region 视野按钮
var Name = "视野按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"缩小","等比","放大");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
  ds_map_add(Map,"引索",ds_list_find_value(List,i))
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#region "修改信息按钮"
var Name = "修改信息按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"修改名称","修改描述","修改封面");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#region "发射按钮"
var Name = "发射按钮"
variable_instance_set(id,string(Name),Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"更新描述","发送");

draw_set_font(fText)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 ds_map_add(Map,"Str",Str)
 
 ds_list_add(variable_instance_get(id,string(Name)),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,string(Name)),ds_list_size(variable_instance_get(id,string(Name)))-1)
}

#endregion

#endregion


#endregion

#endregion

#region 编辑区域
display_set_gui_size(1280,720)
var Name = "编辑区域"
variable_instance_set(id,Name,Ds_Map_Create())

var Map = variable_instance_get(id,Name)

ds_map_add(Map,"编辑窗口X",1280-800)
ds_map_add(Map,"编辑窗口Y",128)
ds_map_add(Map,"编辑窗口W", (1280*0.618)div 32*32)
ds_map_add(Map,"编辑窗口H",(720*0.618) div 32*32)
ds_map_add(Map,"编辑窗口表面",-1)

ds_map_add(Map,"编辑窗口鼠标相对X",0)
ds_map_add(Map,"编辑窗口鼠标相对Y",0)


ds_map_add(Map,"编辑窗口记录鼠标相对X",0)
ds_map_add(Map,"编辑窗口记录鼠标相对Y",0)

ds_map_add(Map,"摄像头X",0)
ds_map_add(Map,"摄像头Y",0)
ds_map_add(Map,"摄像头W",1280)
ds_map_add(Map,"摄像头H",720)
ds_map_add(Map,"摄像头Size",1)
ds_map_add(Map,"摄像头最大Size",1)
ds_map_add(Map,"摄像头最小Size",0.4)

ds_map_add(Map,"物品摆放鼠标相对X",0)
ds_map_add(Map,"物品摆放鼠标相对Y",0)

ds_map_add(Map,"物品摆放X",0)
ds_map_add(Map,"物品摆放Y",0)
ds_map_add(Map,"物品摆放W",1280)
ds_map_add(Map,"物品摆放H",720) //根据宽度跳
ds_map_add(Map,"物品摆放表面",-1)
ds_map_add(Map,"储存表格",ds_grid_create(room_width div 32+1, room_height div 32+1))


ds_map_add(Map,"笔刷分类","玩家")
ds_map_add(Map,"笔刷名称","Save")
ds_map_add(Map,"笔刷角度",0)
ds_map_add(Map,"笔刷力度",0)



#endregion



var file = global.MapFile
ini_open(file+"/Map.ini")
if ini_section_exists("地图信息")
if ini_key_exists("地图信息","基本信息")
{
MapInfo = ds_map_create()
ds_map_read(MapInfo,ini_read_string("地图信息","基本信息",""))
show_debug_message(ini_read_string("地图信息","基本信息",""))
}

#region Debug内容 应对变量 unknown的问题
if debug_mode{
var VarArr = (variable_instance_get_names(id))
VarIndex = ds_map_create()
for (var i = 0; i < array_length_1d(VarArr); ++i) {
 ds_map_add(VarIndex,VarArr[i],variable_instance_get(id,VarArr[i]))
}}
#endregion
