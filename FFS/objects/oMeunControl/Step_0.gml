if (live_call()) return live_result;

//调整 选项 
if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)
{
    if keyboard_check_pressed(vk_up) MeunSelect--;
    if keyboard_check_pressed(vk_down) MeunSelect++;
    
    MeunSelect = min(MeunSelect,array_length_1d(Button)-1)
    MeunSelect = max(0,MeunSelect)
}

if MeunMode = "主菜单"
{
    var utton = 0
        utton[0] = ("开始游戏")
        utton[1] = ("创意工坊")
        utton[2] = ("设置")
        utton[3] = ("退出")
    if keyboard_check_pressed(ord("Z"))
    {
        MeunMode = utton[MeunSelect]
        
        if MeunMode = "退出"
        game_end()
        
        event_user(0)
    }
}

if MeunMode = "开始游戏"
{
        
    if keyboard_check_pressed(ord("Z"))
    {
         if    MeunSelect = 0
         {
             room_goto(room_test)
         }
     
        if    MeunSelect = 1
        {
            steam_activate_overlay_browser(
         "http://steamcommunity.com/app/705840/workshop/"
         )
         
        
        }
        
         if  MeunSelect = 2
         {
             MeunMode = "订阅地图"
              event_user(0)
         }
        
        if    MeunSelect = 3
        {MeunMode = "主菜单"
        event_user(0)
            
        }
    }
}

if MeunMode = "创意工坊"
{
    if keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)
    {   
        
        var OldSel = LocalMapFileSelect
        //左翻
        if keyboard_check_pressed(vk_left)
        {
            LocalMapFileSelect--
            show_debug_message(LocalMapFileSelect)
        }
         //右翻
        if keyboard_check_pressed(vk_right)
        {
            LocalMapFileSelect++
             show_debug_message(LocalMapFileSelect)
        }
        LocalMapFileSelect = min(LocalMapFileSelect,ds_list_size(LocalFileList)-1)
        LocalMapFileSelect = max(0,LocalMapFileSelect)
        
        
        if OldSel != LocalMapFileSelect{
        #region  游戏素材 
        sprite_delete(LocalMapSprite)
       LocalMapFile = string(working_directory)+"本地工程/" + ds_list_find_value(LocalFileList,LocalMapFileSelect)
       LocalMapInfo = ds_map_create()
            #region // 装填信息
                ini_open(LocalMapFile+"/地图信息.ini")
                    LocalMapInfo [?"文件位置"] = LocalMapFile
                    
                    LocalMapInfo [?"地图名"] = ini_read_string("信息","地图名","")
                    LocalMapInfo [?"SteamID"] = ini_read_real("信息","SteamID",-1)
                    LocalMapInfo [?"简介"] = ini_read_string("信息","简介","")
                    
                    
                ini_close()
            #endregion
       LocalMapSprite = sprite_add(LocalMapFile+"/封面.png",0,0,0,0,0)
       
    #endregion
        }
    }
    
    
    var utton = 0
        utton[0] = ("打开地图")
        utton[1] = ("新建地图")
        utton[2] = ("退出")
    if keyboard_check_pressed(ord("Z"))
    {
       
        globalvar  LoadFile ;
        LoadFile =  ""
        
        if MeunSelect = 0
        {
           LoadFile =  LocalMapFile
           room_goto(rCreate)
        }
        
            if MeunSelect = 1
        {
           LoadFile =  ""
           room_goto(rCreate)
        }
        
        if MeunSelect =2
       { MeunMode = "主菜单"
        event_user(0)
       }
    }
}

if MeunMode =  "设置"
{
    
         var map = GameRunInfo[?"音量"]
             if MeunSelect = 1
         {

            if keyboard_check(vk_left)
            map[?"背景音乐"]--
            
            if keyboard_check(vk_right)
            map[?"背景音乐"]++
           
            map[?"背景音乐"] = max(0,map[?"背景音乐"])
            map[?"背景音乐"] = min(100,map[?"背景音乐"])
        }
             if MeunSelect = 2
         {
        if keyboard_check(vk_left)
            map[?"游戏音效"]--
            
            if keyboard_check(vk_right)
            map[?"游戏音效"]++
           
            map[?"游戏音效"] = max(0,map[?"游戏音效"])
            map[?"游戏音效"] = min(100,map[?"游戏音效"])
         }
 
    if keyboard_check_pressed(ord("Z"))
    {

        var map = GameRunInfo[?"界面"]
        //调整全屏
        if MeunSelect = 0
        {
            var Full = window_get_fullscreen()
            Full^=true;
            window_set_fullscreen(Full)

            map[?"全屏"] = Full;
        }
       
    
     if MeunSelect = 4
        {MeunMode = "主菜单"
        event_user(0)}
    }
}

if MeunMode = "订阅地图"
{
     if keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)
    {   
        
        var OldSel = SteamMapFileSelect
        //左翻
        if keyboard_check_pressed(vk_left)
        {
            SteamMapFileSelect--
            show_debug_message(SteamMapFileSelect)
        }
         //右翻
        if keyboard_check_pressed(vk_right)
        {
            SteamMapFileSelect++
             show_debug_message(SteamMapFileSelect)
        }
        SteamMapFileSelect = min(SteamMapFileSelect,ds_list_size(SteamFileList)-1)
        SteamMapFileSelect = max(0,SteamMapFileSelect)
        
        
        if OldSel != SteamMapFileSelect{
        #region  游戏素材 
        sprite_delete(SteamMapSprite)
         var map = ds_map_create()
         
         
           steam_ugc_get_item_install_info( SteamFileList[|SteamMapFileSelect],map)
           
       SteamMapFile =  map[?"folder"]//string(working_directory)+"本地工程/" + ds_list_find_value(LocalFileList,LocalMapFileSelect)
       SteamMapInfo = ds_map_create()
            #region // 装填信息
                ini_open(SteamMapFile+"/地图信息.ini")
                    SteamMapInfo [?"文件位置"] = SteamMapFile
                    
                    SteamMapInfo [?"地图名"] = ini_read_string("信息","地图名","")
                    SteamMapInfo [?"SteamID"] = ini_read_real("信息","SteamID",-1)
                    SteamMapInfo [?"简介"] = ini_read_string("信息","简介","")
                    
                    
                ini_close()
            #endregion
       SteamMapSprite = sprite_add(SteamMapFile+"/封面.png",0,0,0,0,0)
       
    #endregion
        }
    }
    
    
    var utton = 0
       
    if keyboard_check_pressed(ord("Z"))
    {
       
        
        if MeunSelect = 1
        {
            MeunMode = "开始游戏"
            event_user(0)
        }
    }
}