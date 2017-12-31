/// @description 
oGame.rTitleObject = self.object_index
Select = 0

draw_set_font(fTitle)

Meun = 0
Meun[0] =MeunGetStr("故事模式")
Meun[1] = MeunGetStr("Steam订阅");
Meun[2] = MeunGetStr("编辑地图");
Meun[3] = MeunGetStr("游戏设置");
Meun[4] = MeunGetStr("退出游戏");

 MeunButton = 0
for (var i = 0; i < array_length_1d(Meun); ++i) {
	var H =  string_height(Meun[i] )
var h = 4
var W = string_width(Meun[i] )
 MeunButton[i] =   ButtonInfo(0,720-(array_length_1d(Meun)-i)*H+h,W,H)
}

