/// @description scr_get_angle_below_object(x_offset_left, x_offset_right, grav_direction, depth_below, collision)
/// @function scr_get_angle_below_object
/// @param x_offset_left
/// @param  x_offset_right
/// @param  grav_direction
/// @param  depth_below
/// @param  collision

// Checks beneath two 'feet' of the calling instance for collision.
    
var x_offset_left       = argument0;        // x distance to left and right foot of the sprite from origin
var x_offset_right      = argument1;
var grav_direction      = argument2;
var depth_below         = argument3;        // how far below to test
var collision           = argument4; 

var xDist1 = x+lengthdir_x(x_offset_left, grav_direction - 90)  // left point
var yDist1 = y+lengthdir_y(x_offset_left, grav_direction - 90)

for (var i = 0; i < depth_below; i++)
    {
    var left_foot_x = xDist1+lengthdir_x(i, grav_direction)
    var left_foot_y = yDist1+lengthdir_y(i, grav_direction)

    if collision_point(left_foot_x, left_foot_y, collision,1,1) 
        then
        {
        var xDist2 = x+lengthdir_x(x_offset_right, grav_direction + 90) // right point
        var yDist2 = y+lengthdir_y(x_offset_right, grav_direction + 90)
        
        for(var j = 0; j < depth_below; j++)
            {
            var right_foot_x = xDist2+lengthdir_x(j, grav_direction)
            var right_foot_y = yDist2+lengthdir_y(j, grav_direction)

            if collision_point(right_foot_x, right_foot_y, collision,1,1) 
                then
                {
                return point_direction(left_foot_x, left_foot_y, right_foot_x, right_foot_y);
                }
            } 
        }  
    }    