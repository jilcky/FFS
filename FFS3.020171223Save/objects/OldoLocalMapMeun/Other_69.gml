/// @description 
#region 获取新ID
var event_id = async_load[? "id"];
if event_id == new_item
   {
   var type = async_load[? "event_type"];
   if type == "ugc_create_item"
      {
		  if oGame.MapInfo[?"SteamID"] =noone
      oGame.MapInfo[?"SteamID"] = async_load[? "published_file_id"];
      }
   }
   
#endregion


#region 上传内容
if oGame.MapInfo[?"SteamID"]{
var app_id = steam_get_app_id();
var updateHandle = steam_ugc_start_item_update(app_id, oGame.MapInfo[?"SteamID"]);
steam_ugc_set_item_title(updateHandle, oGame.MapInfo[?"地图名称"]);
steam_ugc_set_item_description( updateHandle,"gay");
steam_ugc_set_item_visibility(updateHandle, ugc_visibility_private);//目前还是当自己的内容
var tagArray;
tagArray[0] = "Map";
steam_ugc_set_item_tags(updateHandle, tagArray);
steam_ugc_set_item_preview(updateHandle, "小蓝.png");
steam_ugc_set_item_content(updateHandle, "本地地图/"+string(oGame.MapInfo[?"本地ID"]));
requestId = steam_ugc_submit_item_update(updateHandle, "Version 1.2")
}
#endregion

if  oGame.MapInfo[?"SteamID"]{
 uploadMap = ds_map_create();
steam_ugc_get_item_update_progress(oGame.MapInfo[?"SteamID"], uploadMap);
var statusCode = uploadMap[? "status_code"];
var status = uploadMap[? "status_string"];
var processed = uploadMap[? "bytes_processed"];
var total = uploadMap[? "bytes_total"];

//ds_map_destroy(uploadMap);
}