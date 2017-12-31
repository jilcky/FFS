/// @description 
/// @description 

var event_id = async_load[? "id"];
if event_id == new_item
   {
   var type = async_load[? "event_type"];
   if type == "ugc_create_item"
      {
	//ShowDebug("获取SteamID")
     Publish_ID = async_load[? "published_file_id"];
	  event_user(0)
      }
   }
   else
   {
//	M =    ds_map_write(async_load)
//	B = Ds_Map_Create()
//	 ds_map_read(B,M)
   }
   update= steam_ugc_get_item_update_progress( new_item, uploadMap);
   
 var key = ds_map_find_first(async_load)
for (var i = 0; i < ds_map_size(async_load); ++i) {
 ShowDebug("steam事件           "+string(key)+":"+string(async_load[?key]))
 key = ds_map_find_next(async_load,key)
}
