/// @description Insert description here
if (live_call()) return live_result;
    
    display_set_gui_size(1280,720)

if true{   
//if LoadFile = ""
{
    MapGrid = ds_grid_create(800 div 16, 450 div 16)
}
    MapSurface = -1
    
    //绘制的坐标
    WinX = 0
    WinY = 0
    
    //按下记录鼠标
    SaveMX = 0
    SaveMY = 0
    //记录窗口
    SaveWinX = 0
    SaveWInY = 0
    //偏移
    PX = 0
    PY = 0
    
    //记录格子
    GridX = 0
    GridY = 0
    
    MapSize = 1
}//游戏表面编辑窗口有关

//游戏菜单有关
MeunSelect = 0

//编辑画笔有关
    //画笔方向
    PenAngle = 2
    PenSpr = -1
    PenSelect = 0