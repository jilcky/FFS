/// @description  Draw

if x_skew != 0
    then
    {
    scr_draw_sprite_skew_ext(spr_grass, image_index, x, y, 1, height, 0, color_grass, 0.8, x_skew, 0);
    }
else
    {
    draw_sprite_ext(spr_grass, image_index, x, y, 1, height, 0, color_grass, 0.8);
    }

