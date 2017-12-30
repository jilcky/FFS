				MaxID+=1
	ds_list_add(List,MaxID)

Part =  ds_list_size(List)-1

		#region 保存地图列表
ini_open("GameSetting.ini")
ini_section_delete("本地地图列表",)

if ds_list_size(List)
ini_write_string("本地地图列表","List",ds_list_write(List))

ini_write_real("本地地图列表","最大ID",MaxID)
ini_close()
#endregion
		
		#region 装填一个新的地图文件
			directory_create("本地地图/"+string(MaxID))
			
		  MapInfo = ds_map_create()
			ds_map_add(MapInfo,"名称","No:"+string(MaxID))
			ds_map_add(MapInfo,"描述"," ")
			ds_map_add(MapInfo,"SteamID",0)
			ds_map_add(MapInfo,"LocalID",MaxID)
			ds_map_add(MapInfo,"作者语言",oGame.Language)
			ds_map_add(MapInfo,"创建日期",date_current_datetime())
			ds_map_add(MapInfo,"修改日期",0)
			ds_map_add(MapInfo,"实例池数量",0)
			ds_map_add(MapInfo,"房间宽度",1280/2)
			ds_map_add(MapInfo,"房间高度",720/2)
			ini_open("本地地图/"+string(MaxID)+"/Map.ini")
			
MapInfo[?"修改日期"] = date_current_datetime()

var str = ds_map_write(MapInfo)

ini_section_exists("地图信息")
ini_section_delete("地图信息")

ini_section_exists("对应文本")
ini_section_delete("对应文本")

ini_write_string("地图信息","基本信息",str)

if debug_mode{
var str = ""
var map  = MapInfo
var key = ds_map_find_first(map)
for (var i = 0; i < ds_map_size(map); ++i) {
    
	str+= string(key)+":"+string(ds_map_find_value(map,key))+" "
	key = ds_map_find_next(map,key)
}
ini_write_string("对应文本","基本信息",str)
}
ini_write_string("版本验证","游戏程序版本","3.0")
			ini_close()
		#endregion
			
		#region //装填封面
		var SP = sprite_add("FakeSuperSonia.png",1,0,0,0,0)
var Suf = surface_create(1280,720)
surface_set_target(Suf)
var size = 1280/sprite_get_width(SP)
var w = sprite_get_width(SP)
sprite_set_offset(SP,w/2,0)
draw_sprite_ext(SP,0,w/2*size,0,size,size,0,c_white,1)
surface_reset_target()
surface_save(Suf,"本地地图/"+string(MaxID)+"/封面.png")
file_copy("FakeSuperSonia.png","本地地图/"+string(MaxID)+"/封面原图.png")
		#endregion



#region 读取地图信息 并且进入编辑器
global.MapFile = "本地地图/"+string(oLocalMapMeun.List[|oLocalMapMeun.Part])
room_goto(rCreate)
#endregion