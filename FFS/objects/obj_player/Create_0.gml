/// @description Initialize Variables

enum state
    {
    on_ground,
    in_air,
    on_wall,
    }

player_state = state.in_air;    

jumping = false;

jump_frames_after = 0;                                  
jump_frames_after_duration = 2;                         //how many frames after the player is falling he can still jump. greatly improves gamefeel because the human brain doesn't work in pc frames

jump_frames_before = 0;
jump_frames_before_duration = 6;                        //how many frames before landing the player can push the jump button so that the jump gets executed as soon as he hits ground. same reason as above 

jump_height = 10;                                       
additional_jump_height_by_running = 0.3;                //additional height is h_speed multipied with this number
additional_jump_height_by_holding = 1;                  //the higher the number the faster you fall back to earth

double_jump = 1;
double_jump_delay_amount = 4;                           //how many frames the player has to be in air until he can doublejump. the player almost certainly doesn't want to press the double jump immediately after jumping
double_jump_delay_timer = double_jump_delay_amount;

wall_jump_distance = 4;                                 //sets current max speed
wall_jump_height = 5;                                  //sets vertical speed to minus that number

stuck_to_wall_frames_amount = 8;                        //how many frames the player is sticking to a wall when jumping onto it
stuck_to_wall_timer = 0;

fall_off_wall_delay_amount = 8;                         //how long you need to press in opposite direction to fall off from a wall
fall_off_wall_delay = fall_off_wall_delay_amount;

wall_sliding_speed = 3;                                 //how fast youre falling when sliding down on a wall
free_fall_speed = 8;        //24                       //how fast youre falling when not sliding down on a wall
max_drop_speed = free_fall_speed;

g = 1;                                                  //amount of gravity
g_direction = 270;                                      //gravity direction (not implemented yet anywhere)

acceleration_on_ground = 0.8;
acceleration_in_air = 0.8;                              // most importantly changes the wall jump arc

friction_on_ground = 8;                                 //how much speed you will lose per step when on ground and not pressing in that direction
friction_in_air = 8;                                  //how much speed you will lose per step when in air and not pressing in that direction

target_max_speed = 8;                                   //the "normal" horizontal speedlimit
current_max_speed = target_max_speed;                   //current_max_speed is always getting closer to target_max_speed e.g. after changing it on a slope 

h_speed = 0;                                            //actual current horizontal speed for the player
v_speed = 0;                                            //actual current vertical speed for the player
h_speed_excess = 0;
v_speed_excess = 0;
h_speed_final = 0;
v_speed_final = 0;

///Procedual Animation Variables

image_speed = 0.4;

angle = 0;
dir = 1;

///Trail

var color_change    = irandom(255);
color_body          = make_colour_hsv(color_change, 200, 255);
color_trail         = make_colour_hsv(color_change, 200, 255);

y_scale_top     = 1;
y_scale_bottom  = 1;
x_scale_left    = 1;
x_scale_right   = 1;

y_scale_top_impulse     = 1;
y_scale_bottom_impulse  = 1;
x_scale_left_impulse    = 1;
x_scale_right_impulse   = 1;

x_offset = sprite_get_xoffset(sprite_index);
y_offset = sprite_get_yoffset(sprite_index);

