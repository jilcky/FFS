/// @description Procedual Animation

if !place_meeting(x + dir, y, obj_parent_collision)
    then
    {
    x_scale_right = (1+(abs(h_speed)/25)-(abs(v_speed)/25));
    x_scale_right = (clamp(x_scale_right, 0.7, 2)) * x_scale_right_impulse;
    }
else
    {
    x_scale_right = 1;
    }
    
if !place_meeting(x - dir, y, obj_parent_collision)
    then
    {
    x_scale_left = (1+(abs(h_speed)/25)-(abs(v_speed)/25));
    x_scale_left = (clamp (x_scale_left, 0.7, 2)) * x_scale_left_impulse;
    }
else
    {
    x_scale_left = 1;
    }
    
if !place_meeting(x, y-1, obj_parent_collision)
    then
    {
    y_scale_top = (1+(abs(v_speed)/25)-(abs(h_speed)/25));
    y_scale_top = clamp (y_scale_top, 0.7, 2) * y_scale_top_impulse;
    }
else
    {
    y_scale_top = 1;
    }    
    
if !place_meeting(x, y+1, obj_parent_collision)
    then
    {
    y_scale_bottom = (1+(abs(v_speed)/25)-(abs(h_speed)/25));
    y_scale_bottom = clamp (y_scale_bottom, 0.7, 2) * y_scale_bottom_impulse;
    }
else
    {
    y_scale_bottom = 1;
    }  

// Slowly reset scale_impulse

x_scale_left_impulse    = scr_approach(x_scale_left_impulse, 1, 0.2);   //0.08;
x_scale_right_impulse   = scr_approach(x_scale_right_impulse, 1, 0.2);
y_scale_top_impulse     = scr_approach(y_scale_top_impulse, 1, 0.2);
y_scale_bottom_impulse  = scr_approach(y_scale_bottom_impulse, 1, 0.2);



