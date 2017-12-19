
with(oObject)
{
instance_destroy()
}

//基本信息 
if ini_key_exists("地图信息","地图信息")
{
ds_map_clear(MapInfo)
ds_map_read(MapInfo,ini_read_string("地图信息","地图信息","free"))
}
//摆放obj
for (var i = 0; ini_key_exists("地图信息",i); ++i) {
	var str = ini_read_string("地图信息",i,"free")
	ShowDebug(str)
var Map = UI.LoadMap
ds_map_clear(Map)
ds_map_read(Map,str)
	
var C = instance_create_layer(0,0,"Obj",oObject)
C.Name = Map[?"名称"]
var map = AllPenMap[?Map[?"名称"]]
C.sprite_index = map[?"精灵"]
C.x = Map[?"X"]
C.y = Map[?"Y"]

//if ds_map_exists()  假如还有其他的就戴上了个咯

}


