/// @description 上传Steam


var app_id = steam_get_app_id();
var updateHandle = steam_ugc_start_item_update(app_id,  Publish_ID );
steam_ugc_set_item_title(updateHandle, "创建:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime()));
steam_ugc_set_item_description( updateHandle,C);
steam_ugc_set_item_visibility(updateHandle, ugc_visibility_private);//目前还是当自己的内容
var tagArray;
tagArray[0] = "Map";
steam_ugc_set_item_tags(updateHandle, tagArray);
steam_ugc_set_item_preview(updateHandle, "小蓝.png");
steam_ugc_set_item_content(updateHandle, "本地地图/");
requestId = steam_ugc_submit_item_update(updateHandle, "Time:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime()))

//	show_debug_message("执行上传"+"更新Time:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime())) 