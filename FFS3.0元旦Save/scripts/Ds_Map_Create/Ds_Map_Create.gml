var Name = "A"
if !variable_instance_exists(id,Name)
variable_instance_set(id,Name,ds_map_create())

var Name = "B"
if !variable_instance_exists(id,Name)
variable_instance_set(id,Name,ds_map_create())



var Map = ds_map_create()

var Name = "A"
var Str = "Map"+"No."+string(ds_map_size(variable_instance_get(id,Name)))+" "+"ID:"+string(id)+" "+string(object_get_name(id.object_index))+" "+"事件："+string(event_type)+" "+date_datetime_string(date_current_datetime())
ds_map_add(variable_instance_get(id,Name),Str,Map)

var Name = "B"
ds_map_add(variable_instance_get(id,Name),Str,"Map")


return Map

