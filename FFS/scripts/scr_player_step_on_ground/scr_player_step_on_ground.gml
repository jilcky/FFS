/// @description scr_player_step_on_ground()
/// @function scr_player_step_on_ground

//acceleration && decelleration

if key_left
    then
    {
    h_speed -= acceleration_on_ground;
    dir = -1;
    }
else
    {
    if h_speed < 0
        then
        {
        h_speed = scr_approach(h_speed, 0, friction_on_ground);
        }       
    }
    
if key_right
    then
    {
    h_speed += acceleration_on_ground;
    dir = +1;
    }
else
    {
    if h_speed > 0
        then
        {
        h_speed = scr_approach(h_speed, 0, friction_on_ground);       
        }
    }      

//fall through fall_through platforms

if key_down
    then
    {
    if place_meeting(x, y + 1, obj_parent_platform_one_way) && !place_meeting(x, y, obj_parent_platform_one_way)
        then
        {
        y += 1;
        }
    }
                               
// jump frames 

if key_jump_just_pressed then jump_frames_before = jump_frames_before_duration;

if jump_frames_before > 0
    then
    {
    jump_frames_before = 0;
    jumping = true;
    scr_draw_scale_impulse(1.5, 1.5, 0.5, 0.5);
    scr_particles_create(angle + random(33), x, y + (sprite_height - y_offset), irandom_range(1,3));
    scr_particles_create(angle + 180 - random(33), x, y + (sprite_height - y_offset), irandom_range(1,3));
    double_jump_delay_timer = double_jump_delay_amount;   
    v_speed = -jump_height; 
    audio_play_sound(sfx_jump, 0, 0);
    } 
    
//max_speed

h_speed = clamp(h_speed, -current_max_speed, current_max_speed); 
    
//actual horizontal movement with collision

scr_move_horizontal_collision (h_speed, 8);    
     
//actual vertical movement with collision

scr_move_vertical_collision ();

//current_max_speed

current_max_speed = lerp(current_max_speed, target_max_speed, 0.5); //current_max_speed gets lerped so its always halve between them

//check state...

if !scr_on_ground()
    then
    {
    jump_frames_after = jump_frames_after_duration;
    player_state = state.in_air;
    }
