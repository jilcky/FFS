/// @description 
 
 

var statusCode = uploadMap[? "status_code"];
var status = uploadMap[? "status_string"];
var processed = uploadMap[? "bytes_processed"];
var total = uploadMap[? "bytes_total"];
draw_text(32, 0, "Upload info for item:" + string( new_item));
draw_text(32, 15, "status code:" + string(statusCode));
draw_text(32, 30, "status:" + string(status));
draw_text(32, 45, "bytes processed:" +string(processed));
draw_text(32, 60, "bytes total:" + string( total));
