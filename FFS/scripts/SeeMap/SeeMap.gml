
var map = argument0
var str  = argument1
if true//debug_mode
{
var key = ds_map_find_first(map)
for (var i = 0; i < ds_map_size(map); ++i) {
//ShowDebug
show_debug_message(string(str)+string(key)+":"+string(ds_map_find_value(map,key)))
key = ds_map_find_next(map,key)
}
}