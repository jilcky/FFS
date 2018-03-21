if (live_call()) return live_result;

#region 绘制一个 透明的黑底背景
draw_set_color(c_black)
var OldAlp = draw_get_alpha()
draw_set_alpha(0.6)
draw_rectangle(0,0,GameInfo.Width,GameInfo.Height,0)
draw_set_alpha(OldAlp)
#endregion

#region 绘制菜单页面
draw_set_font(fText)
draw_set_color(c_white)



Button = 0

if MeunMode = "主菜单"
{
        Button[0] = MeunInfoGet("开始游戏")
        Button[1] = MeunInfoGet("创意工坊")
        Button[2] = MeunInfoGet("设置")
        Button[3] = MeunInfoGet("退出")
    }
if MeunMode = "开始游戏"
{
        Button[0] = MeunInfoGet("剧情模式")
        Button[1] = MeunInfoGet("打开创意工坊")
        Button[2] = MeunInfoGet("订阅地图")
        Button[3] = MeunInfoGet("退出")
    } 
if MeunMode = "设置"
{
        
        Button[0] = MeunInfoGet("全屏")+":"+string(window_get_fullscreen())
        var map = GameRunInfo[?"音量"]
       Button[1] = MeunInfoGet("BGM音量")+":"+string(map[?"背景音乐"])
       Button[2] = MeunInfoGet("SE音量")+":"+string(map[?"游戏音效"])
       Button[3] = MeunInfoGet("设置键位")
       Button[4] = MeunInfoGet("退出")
    }
if MeunMode = "剧情模式"
{
    
}
if MeunMode = "创意工坊"
{    
    Button[0] = "打开地图"
    Button[1] = "新建地图"
    Button[2] = "退出"
    #region 绘制地图信息
    LocalMapInfo[?"名称"] = "New Project"
    
    var Size = 720/1080
    if sprite_exists(LocalMapSprite)
    draw_sprite_ext(LocalMapSprite,0,128,128,Size,Size,0,c_white,1)
    
   draw_set_halign(2)
    
    var key = ds_map_find_first(LocalMapInfo)
    var Size = ds_map_size(LocalMapInfo)
    for(var i = 0; i < Size ; i++){
        var h = string_height(key)
        draw_text(GameInfo.Width,i*h + GameInfo.Height - Size*h ,string(ds_map_find_value(LocalMapInfo,key))+":"+string(key))
        key = ds_map_find_next(LocalMapInfo,key)
        
    }
    #endregion 
    #region //绘制左右箭头
//        if LocalMapFileSelect + 1 < ds_list_size(LocalFileList)-1
        {
        draw_set_halign(2)
        draw_text(GameInfo.Width,GameInfo.Height/2,"右箭头")}
//        if LocalMapFileSelect - 1 => 0
        {
        draw_set_halign(0)
        draw_text(0,GameInfo.Height/2,"左箭头")}
        
    #endregion
    
}   

if MeunMode = "订阅地图"
{    
    Button[0] = "打开地图"
    Button[1] = "退出"
    #region 绘制地图信息
    SteamMapInfo[?"名称"] = "New Project"
   
   var Size = 720/1080
   
   if sprite_exists(SteamMapSprite)
   draw_sprite_ext(LocalMapSprite,0,128,128,Size,Size,0,c_white,1)
    
   draw_set_halign(2)
    
    var key = ds_map_find_first(SteamMapInfo)
    var Size = ds_map_size(SteamMapInfo)
    for(var i = 0; i < Size ; i++){
        var h = string_height(key)
        draw_text(GameInfo.Width,i*h + GameInfo.Height - Size*h ,string(ds_map_find_value(SteamMapInfo,key))+":"+string(key))
        key = ds_map_find_next(SteamMapInfo,key)
        
    }
    #endregion 
    #region //绘制左右箭头
//        if LocalMapFileSelect + 1 < ds_list_size(LocalFileList)-1
        {
        draw_set_halign(2)
        draw_text(GameInfo.Width,GameInfo.Height/2,"右箭头")}
//        if LocalMapFileSelect - 1 => 0
        {
        draw_set_halign(0)
        draw_text(0,GameInfo.Height/2,"左箭头")}
        
    #endregion
    
}   


  //绘制左下角的按钮  
    draw_set_halign(0)
  var Size =  array_length_1d(Button)
  for (var i = 0; i < Size; ++i) {
      
      
      var str =string(Button[i])
      
      var h = string_height(str)
      
      if i = MeunSelect 
      draw_set_color(c_red)
      else
      draw_set_color(c_white)
      
      
        draw_text(-256 + 256*TweenTime   ,i*h + GameInfo.Height - Size *h ,str)
   }

#endregion