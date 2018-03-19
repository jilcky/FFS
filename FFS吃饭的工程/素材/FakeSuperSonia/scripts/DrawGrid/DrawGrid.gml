var _wide = argument[0];
var inc = argument[1];

for (var i = 0; i < room_height; i += inc) {
	draw_line_width(0,i,room_width,i,_wide);
}

for (var i = 0; i < room_width; i += inc) {
	draw_line_width(i,0,i,room_height,_wide);
}
