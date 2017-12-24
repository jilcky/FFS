/// @description 用于记录本地玩家编辑的地图

#region List
Select = 0
OldSelect = Select
MeunMode = "List"

//列表偏移调整用
Part = 0

draw_set_font(fTitle)
//var Meun;
Meun = 0
 Meun[0] = MeunGetStr("新建地图")
 Meun[1] = MeunGetStr("编辑地图")
 Meun[2] = MeunGetStr("删除地图")
 Meun[3] = MeunGetStr("返回")

 MeunButton = 0
for (var i = 0; i < array_length_1d(Meun); ++i) {
	var H =  string_height(Meun[i] )
var h = 4
var W = string_width(Meun[i] )
 MeunButton[i] =   ButtonInfo(0,720-(array_length_1d(Meun)-i)*H+h,W,H)
}

#endregion


#region Meun
Select2 = 0
OldSelect = Select

new_item = 0

//列表偏移调整用
Part2 = 0

draw_set_font(fTitle)
//var Meun;
Meun2 = 0
 Meun2[0] = "x进入试玩"
Meun2[1] = "修改标题"
Meun2[2] = "修改描述"
Meun2[3] = "选择封面"
Meun2[4] = "x进入编辑地图"
Meun2[5] = "x上传到创意工坊-顺带触发更新描述内容"
Meun2[6] = "删除-长按3秒-并且退出"
Meun2[7]= "O保存并且退出返回列表"

DeleteTime = 0

 MeunButton2 = 0
for (var i = 0; i < array_length_1d(Meun2); ++i) {
	var H =  string_height(Meun2[i] )
var h = 4
var W = string_width(Meun2[i] )
 MeunButton2[i] =   ButtonInfo(0,720-(array_length_1d(Meun2)-i)*H+h,W,H)
}

#endregion
