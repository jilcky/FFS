/// @description 
application_surface_draw_enable(false)
gpu_set_texfilter(true)

window_set_caption("FFS")
//window_set_cursor(cursor);///鼠标类型

#region 游戏按钮
#region 最上方按钮
draw_set_font(fontButton)

TopButton[0] = "保存"
TopButton[1] = "导入"
TopButton[2] = "导出"
TopButton[3] = "清空"
TopButton[4] = "上传"
TopButton[5] = "帮助"
TopButton[6] = "修改封面"
TopButton[7] = "修改描述"
TopButton[8] = "修改名称"
TopButton_w = 96
TopButton_h = 32
TopButtonWidth =(TopButton_w+8)*array_length_1d(TopButton)+TopButton_w/2+8
TopButtonHeight = 33
TopButtonX = 1280-TopButtonWidth//-TopButton_w
TopButtonY = 0
TopButtonSuf = -1
#endregion

#region 分类按钮
draw_set_font(fontButton)

PenSelectButton[0] = "墙体"
PenSelectButton[1] = "玩家"
PenSelectButton[2] = "协助"
PenSelectButton[3] = "威胁"

PenSelect = PenSelectButton[1]

PenSelectButton_w = 96
PenSelectButton_h = 32
PenSelectButtonWidth =(PenSelectButton_w+8)*array_length_1d(PenSelectButton)+PenSelectButton_w/2+8
PenSelectButtonHeight = 33
PenSelectButtonX = 1280-PenSelectButtonWidth//-PenSelectButton_w
PenSelectButtonY = 64
PenSelectButtonSuf = -1
#endregion

#region 注册笔刷
//这个带分类
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
	var SP = asset_get_index("sBlock")
	ds_map_add(Map,"精灵",SP)
	ds_map_add(Map,"描述","描述/r/n"+string(Name))
#endregion
#region 透明
	var Name = "透明墙体"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?"墙体"],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"精灵",SP)
	
#endregion
#region 通常墙体
	var Name = "Fade墙体"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = asset_get_index("sFadeBlock")
	ds_map_add(Map,"精灵",SP)
	ds_map_add(Map,"描述","描述/r/n"+string(Name))
#endregion
#region 踏板
	var Name = "踏板"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = asset_get_index("sFadeBlock")
	ds_map_add(Map,"精灵",SP)
	ds_map_add(Map,"描述","描述/r/n"+string(Name))
#endregion

#endregion

#region 玩家
var Part = "玩家"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 玩家
	var Name = "玩家"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"精灵",SP)
	
#endregion
#region 存档点
	var Name = "存档点"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"精灵",SP)
	
#endregion
#region 终点
	var Name = "终点"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sNoSP
	ds_map_add(Map,"精灵",SP)
	
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
	ds_map_add(Map,"精灵",SP)
	
#endregion


#endregion

#region "威胁"
var Part ="威胁"
//主part
ds_map_add_map(PenMap,Part,ds_map_create())
//子part
#region 尖刺
	var Name = "尖刺"
	var Map = ds_map_create()
	ds_map_add_map(PenMap[?Part],Name,Map)
	var SP = sJianChi
	ds_map_add(Map,"精灵",SP)
	
#endregion


#endregion

#region 再载入一边全部的引索


AllPenMap = ds_map_create()
var Key = ds_map_find_first(PenMap)
for (var i = 0; i < ds_map_size(PenMap); ++i) {
	
	var key = ds_map_find_first(PenMap[?Key])
	for (var a = 0; a < ds_map_size(PenMap[?Key]); ++a) {
		
	    ds_map_add(AllPenMap,key,ds_map_find_value(PenMap[?Key],key))
		
		key = ds_map_find_next(PenMap[?Key],key)
	}
	Key = ds_map_find_next(PenMap,Key)
}
#endregion


#endregion

#region 笔刷按钮

var Str = PenSelect
var Map= PenMap[?Str]
var key = ds_map_find_first(Map)
 PenButton[0] = key
for (var i = 1; i < ds_map_size(Map); ++i) {
	
 PenButton[i] = ds_map_find_next(Map,key)
 key = ds_map_find_next(Map,key)

}

PenButton_w = 96
PenButton_h = 32
PenButtonWidth = 96+PenButton_w/2+8 //(PenButton_w+8)*array_length_1d(PenButton)+PenButton_w/2+8
PenButtonHeight = (PenButton_h+8)*array_length_1d(PenButton)//+PenButton_w/2+8
PenButtonX = 128//1280-PenButtonWidth//-PenButton_w
PenButtonY = 128
PenButtonSuf = -1

PenName = ds_map_find_first(Map)
var Map = PenMap[?PenSelect]
Map = Map[?PenName]
Map = Map[?"精灵"]
//画笔角度
PenArg = 0
//画笔精灵
PenSpr = Map
#endregion

#region 角度按钮

ArgButton[0] = "上"
ArgButton[1] = "左"
ArgButton[2] = "下"
ArgButton[3] = "右"

ArgButton_w = 96
ArgButton_h = 32
ArgButtonWidth = 96+ArgButton_w/2+8 //(ArgButton_w+8)*array_length_1d(ArgButton)+ArgButton_w/2+8
ArgButtonHeight = (ArgButton_h+8)*array_length_1d(ArgButton)//+ArgButton_w/2+8
ArgButtonX = 256//128//1280-ArgButtonWidth//-ArgButton_w
ArgButtonY = 128
ArgButtonSuf = -1


#endregion

#region 透明度按钮
PenAlp = 1
#endregion

#endregion

#region 游戏编辑窗口 表面
GameSuf = -1;
LineSuf = -1;
display_set_gui_size(1280,720)

GameSufX = 1280-800;
GameSufY = 128;
GameSufW = (1280*0.618)div 32*32
GameSufH = (720*0.618) div 32*32

window_set_size(1280,720)
GameCamSize = 1;
GameSufSMx = 0
GameSufSMy = 0
GameSufMx = 0
GameSufMy = 0
GameCameSizeMax = 1
GameCameSizeMin = 0.4
Objx = 0
Objy = 0


#endregion

#region 地图信息
MapInfo = ds_map_create()
ds_map_add(MapInfo,"名称"," ")
ds_map_add(MapInfo,"描述"," ")
ds_map_add(MapInfo,"SteamID",0)
ds_map_add(MapInfo,"创建日期",date_current_datetime())
ds_map_add(MapInfo,"修改日期",0)
ds_map_add(MapInfo,"实例池数量",0)



#region 保存读取用 缓存区域
SaveNo = 0
SaveMap = ds_map_create()
LoadMap = ds_map_create()
#endregion
	#region 加载
		    
	ini_open("临时保存.map")
	scrLoadMap()
	ini_close()
	  
		#endregion


#endregion

#region Steam上传部分


global.steam_api = false;
if steam_initialised()
   {
   if steam_stats_ready() && steam_is_overlay_enabled()
      {
      global.steam_api = true;
      }
   }



 new_item = 0
C=0
 Publish_ID = 1218800105//1220132504
 
 uploadMap = ds_map_create();
updateHandle = 0

Steam_get_user_steam_id = steam_get_user_steam_id()



#endregion
