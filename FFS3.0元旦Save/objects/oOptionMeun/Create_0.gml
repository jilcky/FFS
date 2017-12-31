/// @description 

Select = 0

draw_set_font(fTitle)
//var Meun;
Meun = 0
Meun[0] = MeunGetStr("语言")+":"+string(oGame.Language);
Meun[1] =MeunGetStr("BGM音量")+":"+string(oGame.BGMvolume);
Meun[2] = MeunGetStr("SE音量")+":"+string(oGame.SEvolume);
Meun[3] = MeunGetStr("窗口倍速")+":"+string(oGame.WindowsSize);
Meun[4] = MeunGetStr("全屏")+":"+string(oGame.WindowFull);
Meun[5] = MeunGetStr("返回")


 MeunButton = 0
for (var i = 0; i < array_length_1d(Meun); ++i) {
	var H =  string_height(Meun[i] )
var h = 4
var W = string_width(Meun[i] )
 MeunButton[i] =   ButtonInfo(0,720-(array_length_1d(Meun)-i)*H+h,W,H)
}

