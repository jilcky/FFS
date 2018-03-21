/// @description movement

var v_speed_final;

// Handle sub-pixel movement

v_speed_excess += v_speed;
v_speed_final = round(v_speed);
v_speed_excess -= v_speed_final;

repeat (abs(v_speed_final)) 
    {
    if (!place_meeting(x, y + sign(v_speed_final), obj_parent_collision)) 
        {
        with (obj_player) 
            {
            if (place_meeting(x, y + 1, other.id)) or (place_meeting(x, y - 1, other.id))
            or (place_meeting(x + 1, y, other.id)) or (place_meeting(x - 1, y, other.id)) 
                {
                if !scr_place_meeting_exception(x, y + sign(v_speed_final), obj_parent_collision, other.id)
                    then
                    {
                    y += sign(v_speed_final);
                    }
                }
            }
        y += sign(v_speed_final);
        }
    else
        {
        v_speed *= -1;
        }
    }
    


