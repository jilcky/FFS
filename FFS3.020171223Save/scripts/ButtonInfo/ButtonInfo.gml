var X = argument0
var Y = argument1
var W = argument2
var H = argument3

var Map = ds_map_create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)

return Map