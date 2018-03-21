/// @description Draw
// draw trail

//var trail_width =   min(
//                        abs(x_offset*x_scale_left) + abs((sprite_width-x_offset)*x_scale_right), 
//                        abs(y_offset*y_scale_top) + abs((sprite_height-y_offset)*y_scale_bottom)
//                        );

//scr_draw_trail (66, trail_width, color_trail, -1, true, 0.5, x, y);

//if double_jump = 0
//    then
//    {
//    scr_draw_trail (55, trail_width/2, c_white, -1, true, 0.5, x, y);
//    }
    
//// draw self
                                        
var ground_angle = scr_get_angle_below_object(8, 8, 270, 25, obj_parent_collision);
angle += angle_difference(ground_angle, angle)/2;

//scr_draw_sprite_scaled_rotated(sprite_index, image_index, x, y, x_scale_left*dir, x_scale_right*dir, y_scale_top, y_scale_bottom, angle, c_white, 1);


draw_self()