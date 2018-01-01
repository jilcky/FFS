/// @description 


var app_id = steam_get_app_id();
updateHandle = steam_ugc_start_item_update(app_id,  Publish_ID );
steam_ugc_set_item_title(updateHandle, "创建:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime()));
steam_ugc_set_item_description( updateHandle,C);
steam_ugc_set_item_visibility(updateHandle, ugc_visibility_private);//目前还是当自己的内容
var tagArray;
tagArray[0] = "Map";
steam_ugc_set_item_tags(updateHandle, tagArray);
steam_ugc_set_item_preview(updateHandle, "封面.jpg");
steam_ugc_set_item_content(updateHandle, working_directory);
requestId = steam_ugc_submit_item_update(updateHandle, "Time:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime()))

//	ShowDebug("执行上传"+"更新Time:" + date_date_string(date_current_datetime())+" "+date_time_string(date_current_datetime())) 
