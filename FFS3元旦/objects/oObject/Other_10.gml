/// @description 通用保存方式有差异的单独修改
var map = UI.SaveMap
	ds_map_clear(map)
	ds_map_add(map,"名称",Name)
	ds_map_add(map,"角度",image_angle)
	ds_map_add(map,"X",x)
	ds_map_add(map,"Y",y)
	
	var str = ds_map_write(map)
	ini_write_string("地图信息",string(	UI.SaveNo ),str)
	UI.SaveNo ++
	
	if debug_mode{
var str = ""
//var map  = MapInfo
var key = ds_map_find_first(map)
for (var i = 0; i < ds_map_size(map); ++i) {
    
	str+= string(key)+":"+string(ds_map_find_value(map,key))+" "
	key = ds_map_find_next(map,key)
}
ini_write_string("对应文本",string(	UI.SaveNo ),str)
}