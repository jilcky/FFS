

if ds_map_exists(oGame.MeunTextMap,argument0)
{
var Map =oGame. MeunTextMap[?argument0]
var Text = Map[?Language]
return Text
}
else
return argument0