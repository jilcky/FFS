var Map = argument0
var Key = argument1
var Var = argument2


if ds_map_exists(Map,Key)
{
//加入
	var List  = Map[?Key]
}
else
{
//新建
	var List  = ds_list_create()
	ds_map_add_list(Map,Key,List)
}

if ds_list_find_index(List,Var) = -1
ds_list_add(List,Var)

if argument0 = KeyMap
{
//if ds_list_find_index(KeyOutList,Var) = -1
//ds_list_add(KeyOutList,Var)
}

if argument0 = GamePadMap
{
//if ds_list_find_index(GamePadOutList,Var) = -1
//ds_list_add(GamePadOutList,Var)
}


//if ds_list_find_index(KeyIndexList,Key)=-1
//{
//	ds_list_add(KeyIndexList,Key)
//}