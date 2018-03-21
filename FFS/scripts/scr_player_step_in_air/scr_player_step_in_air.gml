/// @description scr_player_step_in_air()
/// @function scr_player_step_in_air

//acceleration

if key_left                                             // left
    then
    {
    h_speed -= acceleration_in_air;
    dir = -1;
    }  
                     
if key_right                                            // right
    then
    {
    h_speed += acceleration_in_air;
    dir = +1;
    } 
    
//deceleration

if !(key_left) && !(key_right)
    then
    {
    if abs(h_speed) > 0
        then
        {
        h_speed = scr_approach (h_speed, 0, friction_in_air);
        }  
    }    
     

// jump frames // double_jumping

if key_jump_just_pressed then jump_frames_before = jump_frames_before_duration;

if jump_frames_before > 0
    then
    {
    if jump_frames_after > 0
        then
        {
        if jumping = false
            then
            { 
            jump_frames_before = 0;
            jump_frames_after = 0;
            jumping = true;
            scr_draw_scale_impulse(1.5, 1.5, 0.5, 0.5);
            scr_particles_create(angle + random(33), x, y + (sprite_height - y_offset) * y_scale_bottom, irandom_range(1,3));
            scr_particles_create(angle + 180 - random(33), x, y + (sprite_height - y_offset) * y_scale_bottom, irandom_range(1,3)); 
            double_jump_delay_timer = double_jump_delay_amount;    
            v_speed = - jump_height;                                                                                            // actual jump
            audio_play_sound(sfx_jump, 0, 0);
            }
        }
    else                                                // double_jump      
        {
        if double_jump != 0 
            then
            {
            if double_jump_delay_timer = 0
                then
                {
                double_jump -= 1;
                jump_frames_before = 0;
                scr_draw_scale_impulse(1.5, 1.5, 0.5, 0.5);
                scr_particles_create(angle + random(33), x, y + (sprite_height - y_offset) * y_scale_bottom, irandom_range(3,5));
                scr_particles_create(angle + 180 - random(33), x, y + (sprite_height - y_offset) * y_scale_bottom, irandom_range(3,5));
                v_speed = -(jump_height + additional_jump_height_by_running*abs(h_speed));                                                 // actual jump
                audio_play_sound(sfx_walljump, 0, 0); 
                }
            }
        }
    }        
      
if jump_frames_after > 0
    then
    {
    jump_frames_after -= 1;
    }     
      
if jump_frames_before > 0
    then
    {
    jump_frames_before -= 1;
    }  
    
if double_jump_delay_timer > 0
    then
    {     
    double_jump_delay_timer -= 1;
    }
                  
//turning gravitiy on

v_speed += g; 

//not pressing jump key results in smaller jumps

if !(key_jump) and v_speed < 0
    then
    {
    v_speed += additional_jump_height_by_holding;
    }

//max_speed

max_drop_speed = free_fall_speed;

h_speed = clamp(h_speed, -current_max_speed, current_max_speed);
v_speed = min(v_speed, max_drop_speed);    
   
//actual horizontal movement with collision

scr_move_horizontal_collision (0, 0);    
     
//actual vertical movement with collision

scr_move_vertical_collision ();

if place_meeting(x, y-1, obj_parent_collision)      //bounce your head
    then
    {
    scr_draw_scale_impulse(1.5, 1.5, 0.5, 0.5);
    }

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
    
    fall_off_wall_delay = fall_off_wall_delay_amount;
    double_jump_delay_timer = 0;
    double_jump = 1;
    jumping = false;
        
    scr_draw_scale_impulse(1.5, 1.5, 0.5, 0.5);
    scr_particles_create(angle + random(33), x, y + (sprite_height - y_offset), irandom_range(3,5));
    scr_particles_create(angle + 180 - random(33), x, y + (sprite_height - y_offset), irandom_range(3,5));
    audio_play_sound(sfx_land, 0, 0);
    }
else
    {
    if place_meeting(x + dir, y, obj_parent_platform)
        then
        {
        player_state = state.on_wall;
        
        double_jump = 1;                            // <-- resets double jump after touching a wall
        current_max_speed = target_max_speed;
        
        stuck_to_wall_timer = stuck_to_wall_frames_amount;

        scr_draw_scale_impulse(0.5, 0.5, 1.5, 1.5);
        if dir < 0
            then
            {
            scr_particles_create(angle + 90 - random(33), x - x_offset, y, irandom_range(3,5));
            scr_particles_create(angle - 90 + random(33), x - x_offset, y, irandom_range(3,5));
            }
        else
            {
            scr_particles_create(angle + 90 + random(33), x - x_offset + sprite_width, y, irandom_range(3,5));
            scr_particles_create(angle - 90 - random(33), x - x_offset + sprite_width, y, irandom_range(3,5));
            }
        audio_play_sound(sfx_land, 0, 0);
        }
    }
