/// @description scr_on_ground()
/// @function scr_on_ground

return place_meeting(x, y + 1, obj_parent_platform) or (place_meeting(x, y + 1, obj_parent_platform_one_way) && !place_meeting(x, y, obj_parent_platform_one_way)); 