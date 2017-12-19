var str = ds_map_write(MapInfo)

ini_section_exists("地图信息")
ini_section_delete("地图信息")
ini_write_string("地图信息","基本信息",str)

global.SaveNo = 0
global.SaveMap
{	var map = ds_map_create()
	ds_map_add(map,"名称",Name)
	ds_map_add(map,"角度",Arg)
	ds_map_add(map,"精灵",SP)
	ds_map_add(map,"X",x)
	ds_map_add(map,"Y",y)
	var str = ds_map_write(map)
	ini_write_string("地图信息",string(global.SaveNo ),str)
	global.SaveNo ++
	ds_map_destroy(map)
}
global.SaveNo = 0
//variable_global_set()