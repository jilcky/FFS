/// @description scr_get_keyboard_input()
/// @function scr_get_keyboard_input

key_down = keyboard_check(vk_down); 
key_left = keyboard_check(vk_left);          
key_right = keyboard_check(vk_right);          

key_jump = keyboard_check(ord("Z"));
key_jump_just_pressed = keyboard_check_pressed(ord("Z"));

//cancel each if both opposing directions pressed

if (key_left) && (key_right)                  
    {
    key_left = 0;                           
    key_right = 0;   
    } 