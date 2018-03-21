/// @description scr_particles_create(direction,x,y,number_of_particles)
/// @function scr_particles_create
/// @param direction
/// @param x
/// @param y
/// @param number_of_particles

var dir         = argument0;
var x_position  = argument1;
var y_position  = argument2;
var number      = argument3;
 
repeat(number)
    {
    with(instance_create(x_position, y_position, obj_particle_player))
        {
        direction = dir;
        }
    }