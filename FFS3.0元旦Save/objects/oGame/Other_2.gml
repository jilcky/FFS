game_set_speed(60, gamespeed_fps);
window_set_caption("GM8做的")
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
	
	display_set_gui_size(1280,720)
	#endregion	
	#region 语言
	//语言
	Language = ini_read_string("View","Language",os_get_language())
	//记录语种
	LanguageList = ds_list_create()
	#region 菜单文本
	MeunTextGrid = load_csv("Text.csv")
	MeunTextMap = Ds_Map_Create()
	 
	 //引索
	var  Map = Ds_Map_Create()
	
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
		KeyMap = Ds_Map_Create()
		//KeyOutList = ds_list_create()
		
		GamePadMap = Ds_Map_Create()
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


//返回退出后出现的对应菜单页
rTitleObject = oTitleMeun;
#region 地图

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
room_goto_next()