/// @description 
draw_set_font(fTitle)
for (var i = 0; i < array_length_1d(Meun); ++i) {
var Map =  MeunButton[i] 

//绘制
if Map[?"选中"] = true
draw_rectangle(Map[?"X"],Map[?"Y"],Map[?"X"]+Map[?"W"],Map[?"Y"]+Map[?"H"],true)
draw_text(Map[?"X"],Map[?"Y"],Meun[i])
}

