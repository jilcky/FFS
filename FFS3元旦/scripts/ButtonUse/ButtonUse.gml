show_debug_message(string(argument0)+string(argument1))

var Name = "编辑区域"
var Map = variable_instance_get(id,Name)




switch ( argument0) {
	#region 分类
	  case "分类按钮": 
	Map[?"笔刷分类"] = argument1
        // code here
        break;
	#endregion
	
 #region 最顶端按钮
 case "Top按钮":
 	switch (argument1) {
	#region 保存
		    case "保存":		
			
	var file = global.MapFile //"本地地图/"+string(oLocalMapMeun.List[|oLocalMapMeun.Part])
	ini_open(file+"/Map.ini")
	scrSaveMap()
	ini_close()
	

	room_goto(rTitle)
	        break;
		#endregion
	#region 导出
		    case "导出":
			
			
	      var file;
		file = get_save_filename("地图|*.map", "");
		if file != ""
		 {
		ini_open(file)
	//	scrSaveMap()
		ini_close()
		 file_copy("Varmap.map",file)
		 }
	        break;
		#endregion
	#region 导入
	case "导入":
	   var file;
		file = get_open_filename("地图|*.map", "");
		if file != ""
		 {

	ini_open(file)
//	scrLoadMap()
	ini_close()
		 }
	
	break;
	#endregion
	#region 清空
	case "清空":

	break;
	#endregion
	#region 上传
//	case "上传":
//	if global.steam_api 
//	if  !Publish_ID
//{
//	var app_id = steam_get_app_id();
//	new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
//}
//else
//{
//	event_user(0)
//}

//	break;
	#endregion

		#region 帮助
	case "帮助":

	break;
	#endregion
	#region 修改信息
		case "修改信息":

	break;
	#endregion
	#region 进入试玩
	
	#endregion
	    default:
	        // code here
	        break;
	}
 #endregion

	#region 角度按钮
		  case "方向按钮":
		 
		  switch (argument1) {
		      case "上":
		       Map[?"笔刷角度"] =  0;
		          break;
				   case "左":
		       Map[?"笔刷角度"] =  90;
		          break;
				   case "下":
		       Map[?"笔刷角度"] =  180;
		          break;
				   case "右":
		       Map[?"笔刷角度"] =  270;
		          break;
		     
		  }
		#endregion
		
	#region 力度按钮
	
	  		    case "力度按钮":
		switch (argument1) {
		    case "增加":
		    Map[?"笔刷力度"]+=1
		        break;
				
			   case "减小":
		    Map[?"笔刷力度"]-=1
			Map[?"笔刷力度"] = max(Map[?"笔刷力度"],0)
		        break;
		    default:
		        // code here
		        break;
		}
        break;
	#endregion	  
		  
    
    default:
      #region 笔刷按钮
  		   if  Map[?"笔刷分类"]+"笔刷按钮" =  argument0
			Map[?"笔刷名称"] = argument1
        
  #endregion
        break;
}