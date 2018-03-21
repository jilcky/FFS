/// @description scr_draw_sprite_pos_color(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, image_blend, image_alpha);
/// @function scr_draw_sprite_pos_color
/// @param sprite_index
/// @param  image_index
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  x3
/// @param  y3
/// @param  x4
/// @param  y4
/// @param  image_blend
/// @param  image_alpha

var sprite          = argument0;
var index           = argument1;
var top_left_x      = argument2;
var top_left_y      = argument3;
var top_right_x     = argument4;
var top_right_y     = argument5;
var bottom_right_x  = argument6;
var bottom_right_y  = argument7;
var bottom_left_x   = argument8;
var bottom_left_y   = argument9;
var color           = argument10;
var alpha           = argument11;

var sprite_texture  = sprite_get_texture(sprite, index);

draw_primitive_begin_texture(pr_trianglefan, sprite_texture);

draw_vertex_texture_colour(top_left_x, top_left_y, 0, 0, color, alpha);
draw_vertex_texture_colour(top_right_x, top_right_y, 1, 0, color, alpha);
draw_vertex_texture_colour(bottom_right_x, bottom_right_y, 1, 1, color, alpha);
draw_vertex_texture_colour(bottom_left_x, bottom_left_y, 0, 1, color, alpha);

draw_primitive_end();