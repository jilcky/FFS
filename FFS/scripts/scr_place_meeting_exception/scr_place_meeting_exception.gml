/// @description scr_place_meeting_exception(x, y, obj_parent, object_to_ignore);
/// @function scr_place_meeting_exception
/// @param x
/// @param  y
/// @param  obj_parent
/// @param  object_to_ignore

var exception = argument3;

with (argument2) 
    {
    var this = id;
    
    if (id == exception)
        then
        {
        continue;               //check the next
        }
    else
        {
        with (other)
            {
            if (place_meeting(argument0, argument1, this))
                then
                {
                return true;
                }
            }
        }
    }

// Collision with a different object
return false;