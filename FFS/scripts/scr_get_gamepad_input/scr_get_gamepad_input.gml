/// @description scr_get_gamepad_input(player_number)
/// @function scr_get_gamepad_input
/// @param player_number

var player_number = argument0;

key_up = gamepad_axis_value(player_number, gp_axislv) < -0.3    or gamepad_button_check(player_number, gp_padu);
key_down = gamepad_axis_value(player_number, gp_axislv) >  0.3  or gamepad_button_check(player_number, gp_padd);
key_left = gamepad_axis_value(player_number, gp_axislh) < -0.3  or gamepad_button_check(player_number, gp_padl);
key_right = gamepad_axis_value(player_number, gp_axislh) >  0.3 or gamepad_button_check(player_number, gp_padr);

key_jump = gamepad_button_check(player_number, gp_face1);
key_jump_just_pressed = gamepad_button_check_pressed(player_number, gp_face1);