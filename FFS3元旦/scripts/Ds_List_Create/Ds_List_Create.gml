var Name = "Map引索"
if !variable_instance_exists(id,Name)
variable_instance_set(id,Name,ds_map_create())

var Name = "Map信息"
if !variable_instance_exists(id,Name)
variable_instance_set(id,Name,ds_map_create())



var Map = ds_list_create()

var Name = "Map引索"
var Str = "Map"+"No."+string(ds_map_size(variable_instance_get(id,Name)))+" "+"ID:"+string(id)+" "+string(object_get_name(id.object_index))+" "+"事件："+string(event_type)+" "+date_datetime_string(date_current_datetime())
ds_map_add(variable_instance_get(id,Name),Str,Map)

var Name = "Map信息"
ds_map_add(variable_instance_get(id,Name),Str,"List")


return Map


