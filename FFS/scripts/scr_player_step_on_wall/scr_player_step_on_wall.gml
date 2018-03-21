/// @description scr_player_step_on_wall()
/// @function scr_player_step_on_wall

var collision_left = place_meeting(x-1, y, obj_parent_platform);
var collision_right = place_meeting(x+1, y, obj_parent_platform);

//fall off wall delay

if key_left && collision_right
        then
        { 
        if fall_off_wall_delay > 0
            then
            {
            fall_off_wall_delay -= 1;
            }
        else
            {
            h_speed -= acceleration_in_air;
            dir = -1;
            }
        }  
                     
if key_right && collision_left
        then
        {   
        if fall_off_wall_delay > 0
            then
            {
            fall_off_wall_delay -= 1;
            }
        else
            {
            h_speed += acceleration_in_air;
            dir = +1;
            }
        } 
    
if key_down
    then
    {
    h_speed = -acceleration_in_air * dir;
    }
      
//wall_sliding

max_drop_speed = wall_sliding_speed;

if stuck_to_wall_timer > 0
    then
    {
    if v_speed >= 0
        then
        {
        stuck_to_wall_timer -= 1;
        max_drop_speed = 0;
        }
    }
     
// wall_jumping

if key_jump_just_pressed then jump_frames_before = jump_frames_before_duration;

if jump_frames_before > 0
    then
    {
    jump_frames_before = 0;
    double_jump_delay_timer = double_jump_delay_amount;
    jumping = true;
    scr_draw_scale_impulse(0.5, 0.5, 1.5, 1.5);
    if dir < 0
            then
            {
            scr_particles_create(angle + 90 - random(33), x - x_offset, y, irandom_range(1,3));
            scr_particles_create(angle - 90 + random(33), x - x_offset, y, irandom_range(1,3));
            }
        else
            {
            scr_particles_create(angle + 90 + random(33), x - x_offset + sprite_width, y, irandom_range(1,3));
            scr_particles_create(angle - 90 - random(33), x - x_offset + sprite_width, y, irandom_range(1,3));
            }
    audio_play_sound(sfx_walljump, 0, 0);
    
    if key_left && collision_left
        {       
        v_speed = -wall_jump_height;
        h_speed = wall_jump_distance * (-dir); 
        current_max_speed = abs(h_speed);
        }
    else
        {
        if key_right && collision_right
            {
            v_speed = -wall_jump_height;
            h_speed = wall_jump_distance * (-dir);
            current_max_speed = abs(h_speed);
            }
        else
            {
            v_speed = -jump_height * 0.9;
            h_speed = wall_jump_distance * 1.5 * (-dir);
            current_max_speed = abs(h_speed);
            dir *= -1;
            }
        } 
    }         
                  
//turning gravitiy on

v_speed += g;     
     
//max_speed

v_speed = min(v_speed, max_drop_speed);    
   
//actual horizontal movement with collision

scr_move_horizontal_collision (0, 0);    
     
//actual vertical movement with collision

scr_move_vertical_collision ();

//reset max_speed if it's smaller then target_max_speed

if current_max_speed < target_max_speed
    then
    {
    current_max_speed = target_max_speed;
    }
    
//check state...

if scr_on_ground()
    then
    {
    player_state = state.on_ground;
    
    stuck_to_wall = false;
    fall_off_wall_delay = fall_off_wall_delay_amount;
    double_jump_delay_timer = 0;
    double_jump = 0;
    jumping = false;
    audio_play_sound(sfx_land, 0, 0);
    }
else
    {
    if !collision_left && !collision_right
        then
        {
        player_state = state.in_air;
        
        stuck_to_wall = false;
        fall_off_wall_delay = fall_off_wall_delay_amount;
        }
    }