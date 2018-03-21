/// @description Initialize Variables

var frames_duration_amount = random_range(8, 12);

var scale = random_range(1, 2.5);
image_xscale = scale;
image_yscale = scale;

var angle = random(359);
image_angle = angle;

var alpha = random_range(0.3, 0.9);
image_alpha = alpha;
alpha_fading = alpha/frames_duration_amount;

//color
var color       = colour_get_hue(obj_player.color_body); 
var saturation  = irandom_range(100, 255);
var value       = colour_get_value(obj_player.color_body);

speed = random_range(4,8);
friction = speed/frames_duration_amount;

direction = 0;


