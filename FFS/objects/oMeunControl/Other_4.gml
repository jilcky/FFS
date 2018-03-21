if (live_call()) return live_result;

TweenTime = 0
Button = 0;
display_set_gui_size(GameInfo.Width,GameInfo.Height)
//window_set_size(  GameInfo.Width/2,GameInfo.Height/2)
TweenFire(id, EaseOutCubic, TWEEN_MODE_ONCE, true, 0.0, 0.3 ,"TweenTime",0,1);

MeunSelect = 0


event_user(0)