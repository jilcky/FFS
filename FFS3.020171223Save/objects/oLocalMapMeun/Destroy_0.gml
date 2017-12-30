
if variable_instance_exists(id,"MeunButton")
for (var i = 0; i < array_length_1d( MeunButton); ++i) 
{
ds_map_destroy(MeunButton[i])
}

//保存最大id 和列表

#region 保存地图列表
ini_open("GameSetting.ini")
ini_section_delete("本地地图列表",)

if ds_list_size(List)
ini_write_string("本地地图列表","List",ds_list_write(List))

ini_write_real("本地地图列表","最大ID",MaxID)
ini_close()
#endregion

