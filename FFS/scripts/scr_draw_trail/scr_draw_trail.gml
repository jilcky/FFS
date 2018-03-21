/// @description scr_draw_trail(length,width,color,sprite,slim,alpha,x,y)
/// @function scr_draw_trail
/// @param length
/// @param width
/// @param color
/// @param sprite
/// @param slim
/// @param alpha
/// @param x
/// @param y

//by killer

/*You must use the draw_trail script in the Draw event */

var AlphaT, Texture, Dir, Min, Height;

//Preparing variables

var Length = argument0; //How many previous coordinates will use the trail
var Width = argument1; //How wide will the trail be
var Color = argument2; //Which color will be used to tint the trail
var Sprite = argument3; //Which sprite's texture must be used for the trail. Must have "Used for 3D" marked. -1 for no sprite 
var Slim = argument4; //Whether the trail will slim down at the end
var Alpha = argument5; //The alpha to draw the trail with (0-1), optional
var x_position = argument6; //x coordinate the trail will use
var y_position = argument7; //y coordinate the trail will use

ArrayTrail[0,0] = x_position;
ArrayTrail[0,1] = y_position;

Height = array_height_2d(ArrayTrail); //number of entries in the array

//Getting distance between current and past coordinates
if (Height > 1) 
    then
    {
    ArrayTrail[0,2] = point_distance(ArrayTrail[0,0],ArrayTrail[0,1],ArrayTrail[1,0],ArrayTrail[1,1]) + ArrayTrail[1,2];
    }
else 
    {
    ArrayTrail[0,2] = 0;
    }
    
//Setting the texture
if (Sprite >= 0) 
    then
    {
    Texture = sprite_get_texture(Sprite,0);
    }
else 
    {
    Texture = -1;
    }
    
texture_set_repeat(1);

//Drawing the primitive
draw_primitive_begin_texture(pr_trianglestrip,Texture);

AlphaT = 1;
Dir = 0;
Min = min(Height - 1,Length);

for (var i = 0; i < Min; i++)
    {
    if (ArrayTrail[i,0] != ArrayTrail[i+1,0] or ArrayTrail[i,1] != ArrayTrail[i+1,1])
        then
        {
        Dir = point_direction(ArrayTrail[i,0],ArrayTrail[i,1],ArrayTrail[i+1,0],ArrayTrail[i+1,1]);
        }
    var Len = Width / 2 - ((i + 1) / Min * Width / 2) * Slim;
    var XX = lengthdir_x(Len,Dir + 90); 
    var YY = lengthdir_y(Len,Dir + 90);
    AlphaT = (Min - i) / (Min / 2) * Alpha;
    draw_vertex_texture_color(ArrayTrail[i,0] + XX,ArrayTrail[i,1] + YY,ArrayTrail[i,2] / Width,0,Color,AlphaT);
    draw_vertex_texture_color(ArrayTrail[i,0] - XX,ArrayTrail[i,1] - YY,ArrayTrail[i,2] / Width,1,Color,AlphaT);
    }
    
draw_primitive_end();

//Replacing the coordinates positions within the array
Min = min(Height,Length);

for (var i = Min; i > 0; i--)
    {
    ArrayTrail[i,0] = ArrayTrail[i - 1,0];
    ArrayTrail[i,1] = ArrayTrail[i - 1,1];
    ArrayTrail[i,2] = ArrayTrail[i - 1,2];
    }