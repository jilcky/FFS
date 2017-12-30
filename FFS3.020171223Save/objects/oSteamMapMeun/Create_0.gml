/// @description 用于记录本地玩家编辑的地图
oGame.rTitleObject = self.object_index

#region List
Select = 0
OldSelect = Select
MeunMode = "List"

//左右调整启动的地图
Part = 0

draw_set_font(fTitle)
//var Meun;
Meun = 0
 Meun[0] = MeunGetStr("进入订阅")
 Meun[1] = MeunGetStr("去往创意工坊订阅")
 Meun[2] = MeunGetStr("返回")
 MeunButton = 0
for (var i = 0; i < array_length_1d(Meun); ++i) {
	var H =  string_height(Meun[i] )
var h = 4
var W = string_width(Meun[i] )
 MeunButton[i] =   ButtonInfo(0,720-(array_length_1d(Meun)-i)*H+h,W,H)
}

#endregion



#region Steam订阅的获取
//SID = 0
////获取订阅的id 列表
//steam_list = ds_list_create();
//steam_ugc_get_subscribed_items(steam_list);


//for (var i = 0; i < ds_list_size(steam_list); ++i) {
////解析id 获取大小 放置位置 等
// item_map[i] = ds_map_create();
//steam_ugc_get_item_install_info(steam_list[|i], item_map[i]);
////解析id  获得是否进行了安装
// info_map[i] = ds_map_create();
//steam_ugc_get_item_update_info(steam_list[|i], info_map[i])

////这玩意获取steam信息
//steam_details[i] = steam_ugc_request_item_details(steam_list[|i],30);

////var steam_handle = async_load[?"handle_preview_file"]
//steam_get = steam_ugc_download(steam_handle, string(SID)+".png");
//}

#endregion

#region 获取订阅并且解析筛选
//匹配钥匙 下载的文件里面会携带这个 用这个区分 3.0版本的游戏内容
Key = "/3_0.txt"

//获取订阅数量
steam_ugc_num_subscribed_items()
//获取订阅的id 列表
steam_list = ds_list_create();
steam_ugc_get_subscribed_items(steam_list);


//解析id  获得是否进行了安装
instanlled_list = ds_list_create()
for (var i = 0; i < ds_list_size(steam_list); ++i) {
info_map[i] = ds_map_create();
steam_ugc_get_item_update_info(steam_list[|i], info_map[i])
//解析多少个安装了
var map = info_map[i]
if map[?"is_installed"] = true
{
	ds_list_add(instanlled_list,steam_list[|i])
}
else
{
		show_debug_message(map[?"is_installed"])
}
}

//查看安装数量
if ds_list_size(instanlled_list)
{		
		//将过滤后的ID 放在这里
		  ID_list=ds_list_create()
		  //对应SteamID位置
	for (var i = 0; i < ds_list_size(instanlled_list); ++i) {
			    //获取安装位置
		 item_map = ds_map_create();
		steam_ugc_get_item_install_info(steam_list[|i], item_map);
		var folder = item_map[?"folder"]
				//开始解析 排除一下文件缺失
			if file_exists(string(folder)+"/Map.ini")
			{	
				ini_open(string(folder)+"/Map.ini")
				//做一个版本验证
				if ini_key_exists("版本验证","游戏程序版本")
				if ini_read_string("版本验证","游戏程序版本","3.0")
				ds_list_add(ID_list,instanlled_list[|i])
				ini_close()
				
			}
	}
	
	//获得了过滤后的id列表了
	if ds_list_size(ID_list)
	{
		//解析文件 装在
		show_debug_message(ID_list[|0])
	}
	else
	{
	//数量少 就强推出去
	Instance_Change(oTitleMeun,0)
	}
}
else
{
	//数量少 就强推出去
	Instance_Change(oTitleMeun,0)
}
#endregion
//ID_list
#region 解析筛选后的结果 分析通过IDlist 装填文件

#endregion