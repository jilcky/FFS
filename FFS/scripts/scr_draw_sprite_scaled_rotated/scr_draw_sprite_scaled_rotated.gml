/// @description scr_draw_sprite_scaled_rotated(sprite_index,image_index,x,y,scale_left,scale_right,scale_top,scale_bottom,image_angle,image_color,image_alpha)
/// @function scr_draw_sprite_scaled_rotated
/// @param sprite_index
/// @param image_index
/// @param x
/// @param y
/// @param scale_left
/// @param scale_right
/// @param scale_top
/// @param scale_bottom
/// @param image_angle
/// @param image_color
/// @param image_alpha

/*
draws sprite scaled and then rotated.
*/

var sprite                  = argument0;
var image                   = argument1;
var x_pos                   = argument2;
var y_pos                   = argument3;
var scale_left              = argument4;
var scale_right             = argument5;
var scale_top               = argument6;
var scale_bottom            = argument7;
var angle                   = argument8;
var color                   = argument9;
var alpha                   = argument10;

//set variables for reuse

var cos_angle               = cos(degtorad(-angle));
var sin_angle               = sin(degtorad(-angle));
var width                   = sprite_get_width(sprite); 
var height                  = sprite_get_height(sprite); 
var origin_x_offset         = sprite_get_xoffset(sprite); 
var origin_y_offset         = sprite_get_yoffset(sprite);

//calculate vertices

var top_left_x      = (-origin_x_offset * scale_left);    
var top_left_y      = (-origin_y_offset * scale_top);
var top_right_x     = (+(width - origin_x_offset) * scale_right);
var top_right_y     = (-origin_y_offset * scale_top);
var bottom_right_x  = (+(width - origin_x_offset) * scale_right);
var bottom_right_y  = (+(height - origin_y_offset) * scale_bottom);
var bottom_left_x   = (-origin_x_offset * scale_left);
var bottom_left_y   = (+(height - origin_y_offset) * scale_bottom);

scr_draw_sprite_pos_color   (    
                            sprite, 
                            image,
                            x + top_left_x * cos_angle - top_left_y * sin_angle,
                            y + top_left_x * sin_angle + top_left_y * cos_angle,   
                            x + top_right_x * cos_angle - top_right_y * sin_angle,
                            y + top_right_x * sin_angle + top_right_y * cos_angle,
                            x + bottom_right_x * cos_angle - bottom_right_y * sin_angle,
                            y + bottom_right_x * sin_angle + bottom_right_y * cos_angle,
                            x + bottom_left_x * cos_angle - bottom_left_y * sin_angle,
                            y + bottom_left_x * sin_angle + bottom_left_y * cos_angle,
                            color,
                            alpha
                            );