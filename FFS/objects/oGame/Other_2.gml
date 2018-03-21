/// @description Insert description here
// You can write your code in this editor

enum GameInfo {
Height = 720,
Width = 1280
}

RoomBack = room

#region PC的情况下 测试方便的调整
//if true//os_type = os_windows 
{
	var Size = 0.5
window_set_size(GameInfo.Width*Size,GameInfo.Height*Size)
window_set_position(1920/2-1280/2,1080/2-720/2)//只是单纯的让游戏画面在中间而已
}

#endregion

 ini_open("游戏设定.ini")
 
#region 初化游戏运行中的属性 或者当场调整设置
 //globalvar GameRunInfo;
 globalvar GameRunInfo;
 GameRunInfo = ds_map_create();

	 var map = GameRunInfo;
	#region 音量部分
  map[?"音量"] = ds_map_create();
		var Vmap = GameRunInfo[?"音量"];
		var Section = "音量";
		
		var Key = "角色配音";
		Vmap[?Key] = ini_read_real(Section,Key,80)
		
		var Key = "游戏音效";
		Vmap[?Key] = ini_read_real(Section,Key,80)
		
		var Key = "背景音乐";
		Vmap[?Key] = ini_read_real(Section,Key,80)
 #endregion
	#region 界面部分
		map[?"界面"] = ds_map_create()
		var Wmap =GameRunInfo[?"界面"]
		var Section = "界面"
		
		//设置gui
		display_set_gui_size(GameInfo.Width,GameInfo.Height)
		
		var Key = "窗口高度"
		Wmap[?Key] = ini_read_real(Section,Key,720)
		
		var Key = "窗口宽度"
		Wmap[?Key] = ini_read_real(Section,Key,1280)
		
		window_set_size(Wmap[?"窗口宽度"],Wmap[?"窗口高度"])
		
		var Key = "全屏"
		Wmap[?Key] = ini_read_real(Section,Key,false)
		window_set_fullscreen(Wmap[?Key])
		#region UI元素
		
		
			var Key = "摇杆坐标_X"
			Wmap[?Key] = ini_read_real(Section,Key,720)
			var Key = "摇杆坐标_Y"
			Wmap[?Key] = ini_read_real(Section,Key,720)
		
			var Key = "按钮坐标_X"
			Wmap[?Key] = ini_read_real(Section,Key,720)
			var Key = "按钮坐标_Y"
			Wmap[?Key] = ini_read_real(Section,Key,720)
			
			enum oVk_Button_type
			{
			Tap,
			Double_Taap,
			Drag,
			Filck
			}
			
		#endregion
		
		
#endregion
	#region 控制部分
		//写按钮用
	#endregion
	#region 网络部分
	map[?"网络"] = ds_map_create()
	var Nmap = GameRunInfo[?"网络"]
	var Key = "登陆"
	Nmap[?Key] = false
	
	var Key = "联网"
	Nmap[?Key] = false
	
	#endregion

	map[?"场景"] = room
 
 ini_close()
#endregion

// ini_close()
 
 #region //读取语言文件
 var List = ds_list_create()
 
 ini_open("Index.ini")
 
 for(var i = 0; i < ini_read_real("引索","数量",0);i++)
 {
  ds_list_add(List,ini_read_string("引索",i,""))   
 }
 ini_close()
 
 var file = string(os_get_language())+".ini"
 
 if !file_exists(file)
 {
  file =  "en"+".ini"
 }
 
 ini_open(file)
    globalvar MeunInfo;
    MeunInfo = ds_map_create()
 for(var i = 0; i < ds_list_size(List);i++)
 {
      ds_map_add(MeunInfo,List[|i],ini_read_string("文本",List[|i],""))
     
 }

 
 ini_close()
    #endregion