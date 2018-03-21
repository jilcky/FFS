/// @description scr_approach(current, target, amount)
/// @function scr_approach
/// @param current
/// @param  target
/// @param  amount

var current = argument0;
var target = argument1;
var amount = argument2;

if (current < target)
    then
    {
    current = min(current + amount, target); 
    }
else
    {
    current = max( current - amount, target);
    }
    
return current;