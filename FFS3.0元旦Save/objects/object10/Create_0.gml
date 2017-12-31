
#region Top按钮
var Name = "Top按钮"
variable_instance_set(id,string(Name)+"信息引索列表",Ds_List_Create())
//MaxList = Ds_List_Create()

var List =  Ds_List_Create()

ds_list_add(List,"保存","导入","导出","清空","上传","帮助","修改信息");

draw_set_font(fTitle)
for (var i = 0; i < ds_list_size(List); ++i) {
var X = 0
var Y = 0
 var Str = MeunGetStr(ds_list_find_value(List,i));
 var W = string_width(Str);
 var H = string_height(Str);
 
 var Map = Ds_Map_Create();
ds_map_add(Map,"X",X)
ds_map_add(Map,"Y",Y)
ds_map_add(Map,"W",W)
ds_map_add(Map,"H",H)

ds_map_add(Map,"触碰",false)
ds_map_add(Map,"按下",false)
ds_map_add(Map,"选中",false)
 
 
 ds_list_add(variable_instance_get(id,"Top按钮信息引索列表"),Map)
//ds_list_add(MaxList,Map)
ds_list_mark_as_map(variable_instance_get(id,"Top按钮信息引索列表"),ds_list_size(variable_instance_get(id,"Top按钮信息引索列表"))-1)
}

#endregion




event_user(0)