
var key = argument0;

if ds_map_exists(MeunInfo,key)
return MeunInfo[?key]
else
return "No_"+string(key)