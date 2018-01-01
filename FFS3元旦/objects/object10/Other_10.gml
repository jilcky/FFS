/// @description 呼叫出来清理DS的
var Name = "Map引索"


if variable_instance_exists(id,Name)
{

	var Map = variable_instance_get(id,Name)
#region //循环的是第一个后面的东西

	var Key = ds_map_find_first(Map)
	var Index = ds_map_find_value(Map,Key)
	
	for (var i = 1 ; i < ds_map_size(Map); ++i) {
		var OldKey = string(Key)
		Index = ds_map_find_value(Map,Key)
	    Key = ds_map_find_next(Map,Key)
		
		//if Index!= undefined
		{
	var Map2 = variable_instance_get(id,"Map信息")
	//读取类型 然后删除
	if ds_map_find_value(Map2,OldKey) = "Map"
	ds_map_destroy(Index)
	
	if ds_map_find_value(Map2,OldKey) = "List"
	ds_list_destroy(Index)
	
		}
#endregion



#region //回头再删除第一个
    var Key = ds_map_find_first(Map)
	var Index = ds_map_find_value(Map,Key)

	var Map2 = variable_instance_get(id,"Map信息")
	//读取类型 然后删除
	if ds_map_find_value(Map2,Key) = "Map"
	ds_map_destroy(Index)
	
	if ds_map_find_value(Map2,Key) = "List"
	ds_list_destroy(Index)
	}
#endregion
	


#region 删除两个引索的Map 也就是自己
ds_map_destroy(variable_instance_get(id,"Map引索"))
ds_map_destroy(variable_instance_get(id,"Map信息"))
#endregion

	
}



