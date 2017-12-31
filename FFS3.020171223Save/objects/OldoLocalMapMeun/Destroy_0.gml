for (var i = 0; i < array_length_1d( MeunButton); ++i) 
{
ds_map_destroy(MeunButton[i])
}

for (var i = 0; i < array_length_1d( MeunButton2); ++i) 
{
ds_map_destroy(MeunButton2[i])
}


ini_open("本地地图/"+"本地地图列表.ini")
{	
 ini_write_string("信息","名称Map",ds_map_write(oGame.LocalMapNameMap ))	
 ini_write_string("信息","IDList",ds_list_write(oGame.LocalMapIDList ))

}