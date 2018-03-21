/// @description scr_move_horizontal_collision()
/// @function scr_move_horizontal_collision

v_speed_excess  += v_speed;
v_speed_final   = round(v_speed_excess);
v_speed_excess  -= v_speed_final;

var vertical_direction = sign(v_speed_final); // -1, 0, 1
 
//Vertical Collision


    if vertical_direction < 0               // up
        then
        {
        if (place_meeting(x, y + v_speed_final, obj_parent_platform)) 
            {
            while(!place_meeting(x, y - 1, obj_parent_platform)) 
                {
                y -= 1;
                }
            v_speed = 0;
            v_speed_excess = 0;
            }
        else
            {
            y += v_speed_final;
            }
        }
    else
        { 
        if vertical_direction > 0           // down
            then
            {
            if (place_meeting(x, y + v_speed_final, obj_parent_collision))
                {
                repeat abs(v_speed_final)           
                    {
                    if place_meeting(x, y + 1, obj_parent_platform) or (place_meeting(x, y + 1, obj_parent_platform_one_way) && !place_meeting(x, y, obj_parent_platform_one_way))
                        then
                        {
                        v_speed = 0;
                        v_speed_excess = 0; 
                        break;            
                        }
                    else
                        {
                        y += 1;
                        }
                    }
                }
            else
                {
                y += v_speed_final;
                }
            }
        }
           