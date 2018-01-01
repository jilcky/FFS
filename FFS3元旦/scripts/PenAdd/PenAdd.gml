//初化创建两个变量
if !variable_instance_exists(id,"PenMap")
{
	variable_instance_set(id,"PenMap",Ds_Map_Create())
}
if !variable_instance_exists(id,"AllPenMap")
{
	variable_instance_set(id,"AllPenMap",Ds_Map_Create())
}

var PenMap = variable_instance_get(id,"PenMap")
var AllPenMap = variable_instance_get(id,"AllPenMap")
var Name  = argument0
var SP = GetIndex("s"+Name,asset_sprite)
var Obj =  GetIndex("o"+Name,asset_object)
var Par = argument1
//asset_get_index()
var map = Ds_Map_Create()
ds_map_add(map,"sprite_index",SP)
ds_map_add(map,"object_index",Obj)
ds_map_add(map,"name",Name)
ds_map_add(map,"描述",MeunGetStr(string(Name)+"描述"))

//载入分类
if !ds_map_exists(PenMap,Par){
ds_map_add(PenMap,Par,Ds_Map_Create())
}
if !ds_map_exists(PenMap[?Par],Name)
ds_map_add(PenMap[?Par],Name,map)

//载入总分类
if !ds_map_exists(AllPenMap,Name)
ds_map_add(AllPenMap,Name,map)
