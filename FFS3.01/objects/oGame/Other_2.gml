game_set_speed(60, gamespeed_fps);
#region 读取游戏设定


ini_open("GameSetting.ini")
#region 声音
SEvolume = ini_read_real("volume","SEvolume",100)
BGMvolume =  ini_read_real("volume","BGMvolume",100)
//BGM = noone
#endregion
#region 显示
	#region 窗口
	WindowsSize = ini_read_real("View","WindowSize",1)
	window_set_size(1280*WindowsSize,720*WindowsSize)
	
	WindowFull = ini_read_real("View","WindowFull",0)
	window_set_fullscreen(WindowFull)
	
	#endregion	
	#region 语言
	//语言
	Language = ini_read_string("View","Language",os_get_language())
	//记录语种
	LanguageList = ds_list_create()
	#region 菜单文本
	MeunTextGrid = load_csv("Text.csv")
	MeunTextMap = ds_map_create()
	 
	 //引索
	var  Map = ds_map_create()
	
	for (var h = 1; h < ds_grid_height(MeunTextGrid); ++h) {
		
		for (var w = 1; w < ds_grid_width(MeunTextGrid); ++w) {
		 	ds_map_add(Map,ds_grid_get(MeunTextGrid,w,0),ds_grid_get(MeunTextGrid,w,h))
			
			//添加语种
			if ds_list_find_index(LanguageList,ds_grid_get(MeunTextGrid,w,0))=-1
			{
				ds_list_add(LanguageList,ds_grid_get(MeunTextGrid,w,0))
			}
		}
	 ds_map_add_map(MeunTextMap,ds_grid_get(MeunTextGrid,0,h),Map)
	}
	
	
	#endregion

	#endregion
	
	
#endregion
#region 控制
	#region 鼠标
//用于记录鼠标 是否在使用 
MouseUse = false
MouseOldX = 0;
MouseOldY = 0;

MouseUseClearTime = 0;
MouseUseAddTime = 0;

#endregion
	#region 键位注册
		KeyMap = ds_map_create()
		//KeyOutList = ds_list_create()
		
		GamePadMap = ds_map_create()
		//GamePadOutList = ds_list_create()
		
		
		//KeyIndexList = ds_list_create()
		#region 手柄
		
		KeyMapAdd(GamePadMap,"上",gp_padu)
		KeyMapAdd(GamePadMap,"左",gp_padl)
		KeyMapAdd(GamePadMap,"下",gp_padd)
		KeyMapAdd(GamePadMap,"右",gp_padr)

		KeyMapAdd(GamePadMap,"确定",gp_face1)
		KeyMapAdd(GamePadMap,"确定",gp_start)

		KeyMapAdd(GamePadMap,"取消",gp_face2)
		KeyMapAdd(GamePadMap,"取消",gp_select)

		KeyMapAdd(GamePadMap,"跳跃",gp_face1)
		#endregion
		#region 键盘
	
		KeyMapAdd(KeyMap,"上",vk_up)
		KeyMapAdd(KeyMap,"左",vk_left)
		KeyMapAdd(KeyMap,"下",vk_down)
		KeyMapAdd(KeyMap,"右",vk_right)

		KeyMapAdd(KeyMap,"确定",vk_enter)
		KeyMapAdd(KeyMap,"确定",ord("Z"))

		KeyMapAdd(KeyMap,"取消",vk_escape)
		KeyMapAdd(KeyMap,"取消",ord("X"))

		KeyMapAdd(KeyMap,"跳跃",ord("Z"))
		#endregion
	#endregion
	#region 画笔注册
	#endregion
#endregion
#region 记录
GamePlayTime = ini_read_real("Record","GamePlayTime",0)
GameFirstOpen = ini_read_real("Record","GameFirstOpen",0)




#endregion

ini_close()


#endregion
room_goto(rTitle)

//返回退出后出现的对应菜单页
rTitleObject = oTitleMeun;
#region 地图

#region 地图信息
MapInfo = ds_map_create();
ds_map_add(MapInfo,"地图名称","")
ds_map_add(MapInfo,"地图描述","")
ds_map_add(MapInfo,"SteamID",noone)
ds_map_add(MapInfo,"本地ID",noone)

ds_map_add(MapInfo,"创建日期",noone)
ds_map_add(MapInfo,"修改日期",noone)

ds_map_add(MapInfo,"修改次数",noone)
ds_map_add(MapInfo,"版本号","")

ds_map_add(MapInfo,"实例池子数量",noone)
ds_map_add(MapInfo,"难度指数",noone)

#endregion
#region 读取 本地地图 名单列表
ini_open("本地地图/"+"本地地图列表.ini")
{
			MapInfo[?"本地ID"] = ini_read_real("信息","最大ID",noone)
//			ini_write_real("信息","最大ID",MapInfo[?"本地ID"] +1)
			
			//读取ID对名称的map
			LocalMapNameMap = ds_map_create()
			var mapstr = ini_read_string("信息","名称Map",undefined)
			if mapstr !=undefined
			ds_map_read(LocalMapNameMap,mapstr)
			//读取ID 列表
			LocalMapIDList = ds_list_create()
			var liststr = ini_read_string("信息","IDList",undefined)
			if liststr !=undefined
			ds_list_read(LocalMapIDList,liststr)
			
}
ini_close()


#endregion

#endregion



#region Steam
steam_api = false;
if steam_initialised()
   {
   if steam_stats_ready() && steam_is_overlay_enabled()
      {
 steam_api = true;
      }
   }
#endregion