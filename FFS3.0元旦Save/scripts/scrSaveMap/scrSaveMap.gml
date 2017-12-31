
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


//with(oObject)
//{	
//	event_user(0)
//}

for (var a = 0; a < ds_grid_width(MapGrid); ++a) {
			   for (var b = 0; b < ds_grid_height(MapGrid); ++b) {
if ds_exists(MapGrid[# a,b],ds_type_map)
{
ini_write_string("对应文本","基本信息",ds_map_write(MapGrid[# a,b]))
}
			   }}


	ds_map_clear(SaveMap)
SaveNo = 0

