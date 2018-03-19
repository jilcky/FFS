/// @description 
GameSuf = -1;
LineSuf = -1;

A =ds_list_create()

display_set_gui_size(1280,720)

GameSufX = 1280-800;
GameSufY = 128;
GameSufW = (1280*0.618)div 32*32
GameSufH = (720*0.618) div 32*32

window_set_size(1280,720)
GameCamSize = 1;

#region 最上方按钮
draw_set_font(fontButton)
var Str = 0
Str[0] = "保存"
Str[1] = "导入"
Str[2] = "导出"
Str[3] = "清空"
Str[4] = "删除"
Str[5] = "上传"
Str[6] = "帮助"
Str[7] = "修改描述"
Str[8] = "修改名称"

var X = 0
TopButtonWidth = 0
TopButtonHeight = 0
TopButtonList = ds_list_create()
for (var i = 0; i < array_length_1d(Str); ++i) {
    var Map = ds_map_create()
	ds_map_add(Map,"Str",Str[i])
	ds_map_add(Map,"W",string_width(Str[i]))
	ds_map_add(Map,"H",string_height(Str[i]))
	if i!=0
	X+=string_width(Str[i-1])+32
	//show_debug_message(X)
	ds_map_add(Map,"X",X)
	ds_map_add(Map,"Y",0)
	ds_map_add(Map,"触碰",0)
	ds_map_add(Map,"选中",0)
	
	TopButtonWidth+=Map[?"W"]+32
	TopButtonHeight=Map[?"H"]
	ds_list_add(TopButtonList ,Map)
	ds_list_mark_as_map(TopButtonList,ds_list_size(TopButtonList)-1)
	
	
}


#endregion

#region 游戏窗口左侧 分类图层的按钮
Layer = 0
draw_set_font(fontButton)
var Str = 0
Str[0] = "墙体"
Str[1] = "玩家"
Str[2] = "协助"
Str[3] = "威胁"

var Y = 0
LayerButtonWidth = 0
LayerButtonHeight = 0
LayerButtonList = ds_list_create()
for (var i = 0; i < array_length_1d(Str); ++i) {
    var Map = ds_map_create()
	ds_map_add(Map,"Str",Str[i])
	ds_map_add(Map,"W",string_width(Str[i]))
	ds_map_add(Map,"H",string_height(Str[i]))
	if i!=0
	Y +=string_height(Str[i-1])+32
	
	ds_map_add(Map,"X",0)
	ds_map_add(Map,"Y",Y)
	ds_map_add(Map,"触碰",0)
	ds_map_add(Map,"选中",0)
	
	LayerButtonWidth+=Map[?"W"]+32
	LayerButtonHeight=Map[?"H"]
	ds_list_add(LayerButtonList ,Map)
	ds_list_mark_as_map(LayerButtonList,ds_list_size(LayerButtonList)-1)
}
#endregion

#region Tool 按钮
Tool = 0
draw_set_font(fontButton)
var Str = 0
Str[0] = "笔刷"
Str[1] = "橡皮"
Str[2] = "单体"


var X = 0
var Y = 0
ToolButtonWidth = 0
ToolButtonHeight = 0
ToolButtonList = ds_list_create()
for (var i = 0; i < array_length_1d(Str); ++i) {
    var Map = ds_map_create()
	ds_map_add(Map,"Str",Str[i])
	ds_map_add(Map,"W",string_width(Str[i]))
	ds_map_add(Map,"H",string_height(Str[i]))
	if i!=0
	X +=string_width(Str[i-1])+32
	
	ds_map_add(Map,"X",X)
	ds_map_add(Map,"Y",0)
	ds_map_add(Map,"触碰",0)
	ds_map_add(Map,"选中",0)
	
	ToolButtonWidth+=Map[?"W"]+32
	ToolButtonHeight=Map[?"H"]
	ds_list_add(ToolButtonList ,Map)
	ds_list_mark_as_map(ToolButtonList,ds_list_size(ToolButtonList)-1)
}
#endregion

#region 注册笔刷
PenMap = ds_map_create()
#region 墙体
var Part = "墙体"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 通常墙体
	var Name = "通常墙体"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	ds_map_add(Map,"描述","描述/r/n"+string(Name))
#endregion
#region 透明
	var Name = "透明墙体"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?"墙体"],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion

#endregion

#region 墙体
var Part = "玩家"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 玩家
	var Name = "玩家"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion
#region 存档点
	var Name = "存档点"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion
#region 终点
	var Name = "终点"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion

#endregion

#region "协助"
var Part ="协助"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 玩家
	var Name = "蹦床"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion


#endregion

#region "威胁"
var Part ="威胁"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 玩家
	var Name = "尖刺"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"Spr",SP)
	
#endregion


#endregion


#endregion

GameSufSMx = 0
GameSufSMy = 0
GameSufMx = 0
GameSufMy = 0
Objx = 0
Objy = 0

