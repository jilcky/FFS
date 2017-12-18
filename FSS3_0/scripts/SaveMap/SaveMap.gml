#region 地图信息
var key = ds_map_find_first(MapInfo)
for (var i = 0; i < ds_map_size(MapInfo); ++i) {
	
	var Var = ds_map_find_value(MapInfo,key)
	if is_real(Var)
	{
		ini_write_real("地图信息",string(key),Var)
			if !ini_key_exists("变量属性",string(key))
		ini_write_string("变量属性",string(key),"real")
	}
	if is_string(Var)
	{
		ini_write_string("地图信息",string(key),Var)
			if !ini_key_exists("变量属性",string(key))
		ini_write_string("变量属性",string(key),"str")
		}
	key = ds_map_find_next(MapInfo,key)
}
#endregion


#region 载入实例
			ini_key_delete("地图信息","实例数量")
	with(oObject)
	{
		var No = ini_read_real("地图信息","实例数量",0)
		
		var section = "实例"+"No"+string(No)
		var key = "名称"
		var value = self.Name
		ini_write_string(section,key,value)
		if !ini_key_exists("变量属性",string(key))
		ini_write_string("变量属性",string(key),"str")
		
		
			//var section = "实例"+"No"+No
		var key = "角度"
		var value = self.Arg
		ini_write_real(section,key,value)
			if !ini_key_exists("变量属性",string(key))
			ini_write_string("变量属性",string(key),"real")
		
		//var section = "实例"+"No"+No
		var key = "精灵"
		var value = self.SP
		ini_write_real(section,key,value)
			if !ini_key_exists("变量属性",string(key))
			ini_write_string("变量属性",string(key),"real")
		
		ini_write_real("地图信息","实例数量",No+1)
			ini_write_string("变量属性",string(key),"real")
	}
	
#endregion


