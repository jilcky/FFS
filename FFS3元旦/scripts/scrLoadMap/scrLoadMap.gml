
with(oObject)
{
instance_destroy()
}

//基本信息 
if ini_key_exists("地图信息","基本信息")
{
ds_map_clear(MapInfo)
ds_map_read(MapInfo,ini_read_string("地图信息","基本信息","free"))
}



