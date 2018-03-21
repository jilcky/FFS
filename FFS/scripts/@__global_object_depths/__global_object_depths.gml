// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_player
global.__objectDepths[1] = 0; // obj_controller_background
global.__objectDepths[2] = 0; // obj_controller_music
global.__objectDepths[3] = 0; // obj_controller_description
global.__objectDepths[4] = 0; // obj_parent_collision
global.__objectDepths[5] = 0; // obj_parent_platform
global.__objectDepths[6] = 0; // obj_parent_platform_one_way
global.__objectDepths[7] = 0; // obj_wall_block
global.__objectDepths[8] = 2; // obj_platform_moving_horizontal
global.__objectDepths[9] = 2; // obj_platform_moving_vertical
global.__objectDepths[10] = 2; // obj_slope_left
global.__objectDepths[11] = 2; // obj_slope_right
global.__objectDepths[12] = 2; // obj_platform_one_way
global.__objectDepths[13] = -1410065407; // obj_fade_in
global.__objectDepths[14] = 3; // obj_grass
global.__objectDepths[15] = 2; // obj_particle_player


global.__objectNames[0] = "obj_player";
global.__objectNames[1] = "obj_controller_background";
global.__objectNames[2] = "obj_controller_music";
global.__objectNames[3] = "obj_controller_description";
global.__objectNames[4] = "obj_parent_collision";
global.__objectNames[5] = "obj_parent_platform";
global.__objectNames[6] = "obj_parent_platform_one_way";
global.__objectNames[7] = "obj_wall_block";
global.__objectNames[8] = "obj_platform_moving_horizontal";
global.__objectNames[9] = "obj_platform_moving_vertical";
global.__objectNames[10] = "obj_slope_left";
global.__objectNames[11] = "obj_slope_right";
global.__objectNames[12] = "obj_platform_one_way";
global.__objectNames[13] = "obj_fade_in";
global.__objectNames[14] = "obj_grass";
global.__objectNames[15] = "obj_particle_player";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for