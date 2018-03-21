/// @description  Wiggle back and forth

x_skew = scr_approach(x_skew, x_set, 1);

if (x_skew == x_set)
    then
    {
    x_set *= -0.5;
    }


