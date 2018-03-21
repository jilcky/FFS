/// @description  Fade In from Black

draw_set_alpha(image_alpha);
draw_rectangle_colour(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1.0);

image_alpha -= 0.2;

if (image_alpha <= 0)
    instance_destroy();

