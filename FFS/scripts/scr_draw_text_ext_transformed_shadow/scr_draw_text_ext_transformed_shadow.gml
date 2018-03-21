/// @description scr_draw_text_ext_transformed_shadow(x, y, string, sep, w, xscale, yscale, angle, shadow length, shadow direction, shadow color, shadow alpha);
/// @function scr_draw_text_ext_transformed_shadow
/// @param x
/// @param  y
/// @param  string
/// @param  sep
/// @param  w
/// @param  xscale
/// @param  yscale
/// @param  angle
/// @param  shadow length
/// @param  shadow direction
/// @param  shadow color
/// @param  shadow alpha
//@tehwave

/*  Argument            Description

0   x                   The x coordinate of the drawn string. 
1   y                   The y coordinate of the drawn string. 
2   string              The string to draw. 
3   sep                 The distance in pixels between lines of text. 
4   w                   The maximum width in pixels of the string before a line break.
5   xscale              The horizontal scale.
6   yscale              The vertical scale.
7   angle               The angle of the text.   
    
8   shadow length       The distance in pixels between text and shadow.
9   shadow direction    The angle of the shadow.
10  shadow color        The color of the shadow.
11  shadow alpha        The alpha of the shadow.
*/

//init & assign vars
var xx = argument0, yy = argument1, str = argument2, sep = argument3,
    w = argument4, xscale = argument5, yscale = argument6, 
    angle = argument7, sh_len = argument8, sh_dir = argument9, 
    prev_alpha = draw_get_alpha(), prev_col = draw_get_color();
       
//draw text shadow
draw_set_color(argument10);
draw_set_alpha(argument11);
draw_text_ext_transformed(xx+lengthdir_x(sh_len,sh_dir), yy+lengthdir_y(sh_len,sh_dir), string_hash_to_newline(str), sep, w, xscale, yscale, angle);

//draw text
draw_set_color(prev_col);
draw_set_alpha(prev_alpha);
draw_text_ext_transformed(xx, yy, string_hash_to_newline(str), sep, w, xscale, yscale, angle);