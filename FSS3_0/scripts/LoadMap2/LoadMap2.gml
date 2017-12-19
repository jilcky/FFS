ini_open("Var2.map")



//基本信息 
if ini_key_exists("地图信息","地图信息")
{
ds_map_clear(MapInfo)
ds_map_read(MapInfo,ini_read_string("地图信息","地图信息","free"))
}
//摆放obj
for (var i = 0; ini_key_exists("地图信息",i); ++i) {
	var str = ini_read_string("地图信息",i,"free")
	show_debug_message(str)
//	var map = ds_map_create()
//	ds_map_read(map,str)
var C = instance_create_layer(0,0,"Obj",oObject)
with(C)
{
	
}

	//ds_map_destroy(map)
}

ini_close()

