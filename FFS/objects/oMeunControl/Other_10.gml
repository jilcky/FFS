/// @description 
if (live_call()) return live_result;
 TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.3 ,"TweenTime",0,1);
 
 MeunSelect = 0
 
keyboard_clear(ord("Z"))


if MeunMode = "创意工坊"
{
   
    #region //装填文件引索列表 
    LocalFileList = ds_list_create() //工程列表
    
    
    var     file = file_find_first(working_directory+"本地工程/*",fa_directory)
  
    var 	Dir = string(working_directory)+"本地工程/"+string(file)
	
	
	if Dir != string(working_directory)+"本地工程/"
        {while(directory_exists(Dir) and Dir != string(working_directory)+"本地工程/")
    {
        Dir = string(working_directory)+"本地工程/"+string(file)
        
        ds_list_add(LocalFileList,file)

        
        if Dir != string(working_directory)+"本地工程/"
        file = file_find_next()
        
        show_debug_message(Dir)
    }} //装填文件夹
    else  
    {
        
          directory_create(string(working_directory)+
          "本地工程/"+"New Project")
          file_copy("封面.png",string(working_directory)+
          "本地工程/"+"New Project/封面.png")
          
          file_copy("地图信息.ini",string(working_directory)+
          "本地工程/"+"New Project/地图信息.ini")
          
          ds_list_add(LocalFileList,string(working_directory)+
          "本地工程/"+"New Project")
    }// 当列表没有一个工程的时候初化一个工程
    
    for(var i = 0; i < ds_list_size(LocalFileList);i++)
    {
       if   ds_list_find_value(LocalFileList,i) = ""//string(working_directory)+"本地工程/"
       {
           ds_list_delete(LocalFileList,i)
       }
        
    }//装填文件夹会多几个空的 清理掉
    
    file_find_close()
    #endregion
    
    #region //装填第一个 游戏素材 
       LocalMapFileSelect = 0
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
if MeunMode = "订阅地图"
{
    
    SteamFileList = ds_list_create()
   
     steam_ugc_get_subscribed_items(SteamFileList )
    
    if ds_list_size(SteamFileList){
           SteamMapFileSelect = 0
           
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
    }
    else
    {   //没有订阅强制读取
         steam_activate_overlay_browser(
         "http://steamcommunity.com/app/705840/workshop/"
         )
    }
    
}