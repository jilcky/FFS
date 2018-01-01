/// @description 
#region 解决表面消失的
//var  Suf = 0
var MapInfo = variable_instance_get(id,"编辑区域")

      if !surface_exists( MapInfo[?"物品摆放表面"] )
   {		
	   var Width = MapInfo[?"物品摆放W"];
	   var Height = MapInfo[?"物品摆放H"];
	      	  MapInfo[?"物品摆放表面"]  = surface_create(Width,Height);
			event_user(1)

   }
   
     if !surface_exists( MapInfo[?"编辑窗口表面"] )
   {
	   
	     var Width = MapInfo[?"编辑窗口W"];
	   var Height = MapInfo[?"编辑窗口H"];
	      	  MapInfo[?"编辑窗口表面"]  = surface_create(Width,Height);
			event_user(2)

   }

   #endregion

#region //应对编辑窗口表面消失
gpu_set_texrepeat(false)
draw_set_alpha(1)
var Map = variable_instance_get(id,"编辑区域")
if !surface_exists( Map[?"编辑窗口表面"])
   {
 Map[?"编辑窗口表面"] = surface_create(Map[?"编辑窗口W"],Map[?"编辑窗口H"])
   }
#endregion