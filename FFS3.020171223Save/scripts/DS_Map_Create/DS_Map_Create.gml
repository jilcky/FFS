if !variable_instance_exists(id,"Map全家桶")
variable_instance_set(id,"Map全家桶",ds_map_create())

var Map = ds_map_create()
var Str = "No."+string(ds_map_size(variable_instance_get(id,"Map全家桶")))+" "+"ID:"+string(id)+" "+string(object_get_name(id.object_index))+" "+"事件："+string(event_type)+" "+date_datetime_string(date_current_datetime())
ds_map_add(variable_instance_get(id,"Map全家桶"),Str,Map)


return Map

