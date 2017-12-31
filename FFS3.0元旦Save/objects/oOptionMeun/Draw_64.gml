/// @description 

Meun[0] = MeunGetStr("语言")+":"+string(oGame.Language);
Meun[1] =MeunGetStr("BGM音量")+":"+string(oGame.BGMvolume);
Meun[2] = MeunGetStr("SE音量")+":"+string(oGame.SEvolume);
Meun[3] = MeunGetStr("窗口倍速")+":"+string(oGame.WindowsSize);
Meun[4] = MeunGetStr("全屏")+":"+string(oGame.WindowFull);
Meun[5] = MeunGetStr("返回")

draw_set_font(fTitle)
for (var i = 0; i < array_length_1d(Meun); ++i) {
var Map =  MeunButton[i] 

//绘制
if Map[?"选中"] = true
//draw_set_color(c_red)
//else
//draw_set_color(c_white)

draw_rectangle(Map[?"X"],Map[?"Y"],Map[?"X"]+Map[?"W"],Map[?"Y"]+Map[?"H"],true)
draw_text(Map[?"X"],Map[?"Y"],Meun[i])
}

