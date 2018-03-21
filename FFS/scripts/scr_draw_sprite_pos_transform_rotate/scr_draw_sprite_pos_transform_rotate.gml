/// @description scr_draw_sprite_pos_transform_rotate(sprite_index,image_index,x1,y1,x2,y2,x3,y3,x4,y4,image_angle,image_color,image_alpha)
/// @function scr_draw_sprite_pos_transform_rotate
/// @param sprite_index
/// @param image_index
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param image_angle
/// @param image_color
/// @param image_alpha

/*
draws sprite transformed and rotated
*/

var sprite                  = argument0;
var image                   = argument1;
var top_left_x_offset       = argument2;    // offset by this value
var top_left_y_offset       = argument3;
var top_right_x_offset      = argument4;
var top_right_y_offset      = argument5;
var bottom_right_x_offset   = argument6;
var bottom_right_y_offset   = argument7;
var bottom_left_x_offset    = argument8;
var bottom_left_y_offset    = argument9;
var angle                   = argument10;
var color                   = argument11;
var alpha                   = argument12;

//set variables for reuse

var cos_angle               = cos(degtorad(-angle));
var sin_angle               = sin(degtorad(-angle));
var width                   = sprite_get_width(sprite); 
var height                  = sprite_get_height(sprite); 
var origin_x_offset         = sprite_get_xoffset(sprite); 
var origin_y_offset         = sprite_get_yoffset(sprite);

//calculate vertices

var top_left_x      = (-origin_x_offset + top_left_x_offset);    
var top_left_y      = (-origin_y_offset + top_left_y_offset);
var top_right_x     = (+width - origin_x_offset + top_right_x_offset);
var top_right_y     = (-origin_y_offset + top_right_y_offset);
var bottom_right_x  = (+width - origin_x_offset + bottom_right_x_offset);
var bottom_right_y  = (+height - origin_y_offset + bottom_right_y_offset);
var bottom_left_x   = (-origin_x_offset + bottom_left_x_offset);
var bottom_left_y   = (+height - origin_y_offset + bottom_left_y_offset);

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