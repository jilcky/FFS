/// @description Finite State Machine

//key_variables

scr_get_keyboard_input();

//scr_get_gamepad_input(0);             

//depending on state...

switch(player_state)
    {
    case state.on_ground: scr_player_step_on_ground(); break;
    case state.in_air: scr_player_step_in_air(); break;
    case state.on_wall: scr_player_step_on_wall(); break;
    }

if keyboard_check(vk_shift)
{
	target_max_speed = 4;  
}
else
{
	target_max_speed = 2;  
}