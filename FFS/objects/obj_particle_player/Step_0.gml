/// @description Animation

image_angle += vspeed;

image_alpha -= alpha_fading;

if image_alpha <= 0
    then
    {
    instance_destroy();
    }
    

