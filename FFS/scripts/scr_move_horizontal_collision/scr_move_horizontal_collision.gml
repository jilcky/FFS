/// @description scr_move_horizontal_collision(max_slope, min_slope)
/// @function scr_move_horizontal_collision
/// @param max_slope
/// @param  min_slope

var max_slope       = argument0;    // how many pixels the character can move up on a slope 
var min_slope       = argument1;    // how many pixels the character can move down on a slope

// Horizontal

h_speed_excess  += h_speed;
h_speed_final   = round(h_speed_excess);
h_speed_excess  -= h_speed_final;

var horizontal_direction = sign(h_speed_final); // -1, 0, 1

repeat(abs(h_speed_final)) 
    {
    // Move up slope

    for (var i = 0; i < abs(max_slope); i++)
        {
        if place_meeting(x + horizontal_direction, y - i, obj_parent_platform)
            then
            {
            if !place_meeting(x + horizontal_direction, y - (i + 1), obj_parent_platform)
                then
                {
                y -= (i + 1);
                current_max_speed = 0;
                break;
                }
            }         
        else
            {
            break;
            }
        }

    // Move down slope
    
    for (var i = 1; i < abs(min_slope); i ++) 
        {
        if !place_meeting(x + horizontal_direction, y + i, obj_parent_platform) && !place_meeting(x + horizontal_direction, y + i, obj_parent_platform_one_way)
            then
            {
            if place_meeting(x + horizontal_direction, y + (i + 1), obj_parent_platform) or place_meeting(x + horizontal_direction, y + (i + 1), obj_parent_platform_one_way)
                then
                {
                y += i;
                current_max_speed = 10;
                break;
                }
            }
        else
            {
            break;
            }
        }

   // Move forward
        
    if !place_meeting(x + horizontal_direction, y, obj_parent_platform)
        then
        {
        x += horizontal_direction;
        } 
    else 
        {
        h_speed = 0;
        break
        }
    }   