/// @description movement

var h_speed_final;

// Handle sub-pixel movement
h_speed_excess += h_speed;
h_speed_final = round(h_speed_excess);
h_speed_excess -= h_speed_final;

    
repeat (abs(h_speed_final)) 
    {
    if (!place_meeting(x + sign(h_speed_final), y, obj_parent_collision)) 
        {
        with (obj_player) 
            {
            if (place_meeting(x, y + 1, other.id)) or (place_meeting(x, y - 1, other.id))
            or (place_meeting(x + 1, y, other.id)) or (place_meeting(x - 1, y, other.id)) 
                {
                if !scr_place_meeting_exception(x + sign(h_speed_final), y, obj_parent_collision, other.id)
                    then
                    {
                    x += sign(h_speed_final);
                    }
                }
            }
        x += sign(h_speed_final);
        }
    else
        h_speed *= -1;
    }    


