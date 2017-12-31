

switch (MeunMode) {
    case "List":
      #region 查看 本地地图 和新建地图 返回上级菜单

#region 调试选项部分
#region 调整Part的选中
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 

	//刷
Map[?"选中"] = false;
	//覆盖

var map =  MeunButton[Select]
map[?"选中"] = true;


}
#endregion
#region //鼠标修改 选中
for (var i = 0; i < array_length_1d(MeunButton); ++i) {
var Map =  MeunButton[i] 
	if device_mouse_x_to_gui(0) > Map[?"X"] and device_mouse_x_to_gui(0) < Map[?"X"] +Map[?"W"]
and device_mouse_y_to_gui(0) > Map[?"Y"] and device_mouse_y_to_gui(0) < Map[?"Y"] +Map[?"H"]
and oGame.MouseUse
{
	Map[?"选中"] = true;
	Map[?"触碰"] = true;
	Select = i
}
else
{
	Map[?"触碰"] = false;
}
}
	#endregion

	#region  手柄键盘输入 调整Part的选中
	if KeyCheck("上",0)
	Select--
	
	if KeyCheck("下",0)
	Select++
	#endregion
	
	#region 选中 范围修正
	Select = max(Select,0)
	Select = min(Select,array_length_1d(MeunButton)-1)
	
	#endregion
	
	#region 调整选项

	if KeyCheck("左",0) Part-=6
	if mouse_wheel_up() Part-- 

	
	if KeyCheck("右",0) Part+=6
	if mouse_wheel_down() Part++ 
	Part = min(Part,ds_list_size(oGame.LocalMapIDList)-6)
	
		Part = max(0,Part)
	
for (var i = 1; i < 7; ++i) {

		#region 		//读取出名字
		var ID = ds_list_find_value(oGame.LocalMapIDList,i-1+Part)
		var Name = oGame.LocalMapNameMap[?ID]

		if Name!=undefined
		{
	  Meun[i] = Name
		
		}
		else
		{
		Meun[i] = MeunGetStr("空")
		}
		
		var Map = MeunButton[i] 
		draw_set_font(fTitle)
		//修正按钮的宽度
		Map[?"W"] = string_width(Meun[i])
		#endregion

};
#endregion
#endregion

#region 触发执行部分
		#region 选中+确定触发
		var Map =  MeunButton[Select] 
	if KeyCheck("确定",0) or (oGame.MouseUse and mouse_check_button_pressed(mb_left) and Map[?"触碰"])
	{
		   var ID = ds_list_find_value(oGame.LocalMapIDList,Select-1+Part)
		   var Name = oGame.LocalMapNameMap[?ID]
			if ds_map_exists( oGame.LocalMapNameMap,ID){
		MeunMode = "Meun"
		}
			
		switch (Select) {
			
			  case 7 :
			Instance_Change(oTitleMeun,0)
				   break;
				   
			  case 0 :
			
			#region //新建一个地图
					with(oGame){
				#region 新建地图信息
				ini_open("本地地图/"+"本地地图列表.ini")
			ds_map_clear(MapInfo)	
			ds_map_add(MapInfo,"地图名称","")
			ds_map_add(MapInfo,"地图描述","")
			ds_map_add(MapInfo,"SteamID",noone)
			ds_map_add(MapInfo,"本地ID",noone)

			ds_map_add(MapInfo,"创建日期",noone)
			ds_map_add(MapInfo,"修改日期",noone)

			ds_map_add(MapInfo,"修改次数",noone)
			ds_map_add(MapInfo,"版本号","")

			ds_map_add(MapInfo,"实例池子数量",noone)
			ds_map_add(MapInfo,"难度指数",noone)

				
				
			MapInfo[?"本地ID"] = ini_read_real("信息","最大ID",0)
			ini_write_real("信息","最大ID",MapInfo[?"本地ID"] +1)
			
			MapInfo[?"地图名称"] = MeunGetStr("新地图")+string(MapInfo[?"本地ID"])
			MapInfo[?"创建日期"] = date_current_datetime()
			MapInfo[?"修改次数"] = 0
			
				#endregion
		
			#region 注册进本地列表名单
			ds_list_add(LocalMapIDList,MapInfo[?"本地ID"])
			ds_map_add(LocalMapNameMap,MapInfo[?"本地ID"],MapInfo[?"地图名称"])
			ini_write_string("信息","名称Map",ds_map_write(LocalMapNameMap))
			ini_write_string("信息","IDList",ds_list_write(LocalMapIDList))
			
			ini_close()
			
			
			#endregion
		#region 	//放入新文件夹
		ini_open("本地地图/"+string(MapInfo[?"本地ID"])+"/MapInfo.ini")
			{
			ini_write_string("信息","地图信息",ds_map_write(MapInfo))
			}
			ini_close()
			
		#endregion

			}
				#region 菜单页调到最后面
			Part+=ds_list_size(oGame.LocalMapIDList)-6
			Part = min(Part,ds_list_size(oGame.LocalMapIDList)-6)
		#endregion
			#endregion
			//进入编辑模式
	MeunMode = "Meun"
				break;
				   
		    default:

		        break;
		}
		
	}
	#endregion

//按下后固定选项 
if Select!=OldSelect  {
  #region 加载地图信息
		   if Select!=7 and Select != 0 
		   {
		   var ID = ds_list_find_value(oGame.LocalMapIDList,Select-1+Part)
		   var Name = oGame.LocalMapNameMap[?ID]
			if ds_map_exists( oGame.LocalMapNameMap,ID)
		   {
				ini_open("本地地图/"+string(ID)+"/MapInfo.ini")
				 var str = ini_read_string("信息","地图信息",undefined)
				 if str!=undefined
				ds_map_read(oGame.MapInfo,str)
					else
				{
				
				}
		   }
		   else
		   {
			
		   }
		   
		   ini_close()
		   }
		   #endregion
}
	#endregion

#endregion
        break;
		case "Meun":
		#region 编辑地图信息
		
	
#region 调整选项部分
			#region 调整Part的选中
for (var i = 0; i < array_length_1d(MeunButton2); ++i) {
var Map =  MeunButton2[i] 

	//刷
Map[?"选中"] = false;
	//覆盖

var map =  MeunButton2[Select2]
map[?"选中"] = true;


}
#endregion
#region //鼠标修改 选中
for (var i = 0; i < array_length_1d(MeunButton2); ++i) {
var Map =  MeunButton2[i] 
	if device_mouse_x_to_gui(0) > Map[?"X"] and device_mouse_x_to_gui(0) < Map[?"X"] +Map[?"W"]
and device_mouse_y_to_gui(0) > Map[?"Y"] and device_mouse_y_to_gui(0) < Map[?"Y"] +Map[?"H"]
and oGame.MouseUse
{
	Map[?"选中"] = true;
	Map[?"触碰"] = true;
	Select2 = i
}
else
{
	Map[?"触碰"] = false;
}
}
	#endregion

	#region  手柄键盘输入 调整Part的选中
	if KeyCheck("上",0)
	Select2--
	
	if KeyCheck("下",0)
	Select2++
	#endregion
	
	#region 选中 范围修正
	Select2 = max(Select2,0)
	Select2 = min(Select2,array_length_1d(MeunButton2)-1)
	
	#endregion
#endregion

	
	
	#region 触发执行部分
	switch (Select2) {
		
	      #region 0进入游戏
		    case 0:
			 break;
		  #endregion
	
	      #region 1修改标题
		  case 1:
		  var Map = MeunButton2[1]
		  if KeyCheck("确定",0) or (mouse_check_button_pressed(mb_left)and Map[?"触碰"])
		  {
			  var str =  get_string("地图名称",oGame.MapInfo[?"地图名称"])
			  if str!=""
			  {
			oGame.MapInfo[?"地图名称"] = str
			
			//修改注册表
			oGame.LocalMapNameMap[?oGame.MapInfo[?"本地ID"]] = str
			  }
		  }
		    break;
		  #endregion
	      
		 #region 2修改标题
		  case 2:
		  var Map = MeunButton2[2]
		  if KeyCheck("确定",0) or (mouse_check_button_pressed(mb_left)and Map[?"触碰"])
		  {
			  var str =  get_string("修改地图描述",oGame.MapInfo[?"地图描述"])
			  if str!=""
			oGame.MapInfo[?"地图描述"] = str
		  }
		    break;
		  #endregion
			
     	 #region 3修改封面
		  case 3:
		  var Map = MeunButton2[3]
		  if KeyCheck("确定",0) or (mouse_check_button_pressed(mb_left)and Map[?"触碰"])
		  {
	
			var Pothole = get_open_filename("Image File|*.bmp;*.jpg;*.png;","")
			var file = file_bin_open(Pothole, 2);
			var size = file_bin_size(file);
			file_bin_close(file);
			
			show_message(size)
			 if size <= 1000*1000{
			  if Pothole !=""
			  {
				show_message(Pothole)
				var File = "本地地图/"+string(oGame.MapInfo[?"本地ID"])+"/"
				file_copy(Pothole,File+"封面.jpg")
			  }
			 }
			 else
		  {
		show_message("图片过大")
		  }
			
		  }
		    break;
		  #endregion
		 
		 #region 4编辑地图
		 #endregion
		 
		 #region 5上传到Steam
		   case 5:
		  var Map = MeunButton2[5]
		  if KeyCheck("确定",0) or (mouse_check_button_pressed(mb_left)and Map[?"触碰"]) and false
		  {	
			  //确保Steam开着和接入网络
			  if oGame.steam_api and os_is_network_connected()
			  {
				  if oGame.MapInfo[?"SteamID"]
				  {
					
						//var app_id = steam_get_app_id();
						//var updateHandle = steam_ugc_start_item_update(app_id, oGame.MapInfo[?"SteamID"]);
						//steam_ugc_set_item_title(updateHandle, oGame.MapInfo[?"地图名称"]);
						//steam_ugc_set_item_description( updateHandle,"gay")// oGame.MapInfo[?"地图描述"]);
						//steam_ugc_set_item_visibility(updateHandle, ugc_visibility_private);//目前还是当自己的内容
						//var tagArray;
						//tagArray[0] = "Map";
						//steam_ugc_set_item_tags(updateHandle, tagArray);
						//steam_ugc_set_item_preview(updateHandle, "小蓝.png");
						//steam_ugc_set_item_content(updateHandle, "本地地图/"+string(oGame.MapInfo[?"本地ID"]));
						//requestId = steam_ugc_submit_item_update(updateHandle, "Version 1.2")

				  }
				  else
				  {#region 获取新的SteamID
					  	  var app_id = steam_get_app_id();
						  new_item = steam_ugc_create_item(app_id,ugc_filetype_community)
				   #endregion
			
				  }
				//var app_id = steam_get_app_id（）; 
			//	new_item = steam_ugc_create_item（app_id，ugc_filetype_community）;
			  }
			  else
			  {
			  show_debug_message("断网")
			  }
		  }
		  break;
		 #endregion
		 
		 #region 6删除
		 case 6:
		 	  var Map = MeunButton2[6]
		  if KeyCheck("确定",1) or (mouse_check_button(mb_left) and Map[?"触碰"])
	{
		DeleteTime++
	}
	else
	{
		DeleteTime = 0 // room_speed*3
	}
		 if DeleteTime =  room_speed*2
		 {
			var ID = ds_list_find_index(oGame.LocalMapIDList,Select-1+Part)
		   var Name = oGame.LocalMapNameMap[?ID]
		   
		   //删除名字
		   ds_map_delete(oGame.LocalMapNameMap,ID)
		   //删除ID
		   ds_list_delete(oGame.LocalMapIDList,Select-1+Part)
		   //删除文件夹
		   directory_destroy("本地地图/"+string(ID))
		   
		   MeunMode = "List" ;
		 }
		 break;
		 #endregion
		 
		 #region 保存并且退出
			 case 7:
		 	  var Map = MeunButton2[7]
		  if KeyCheck("确定",0) or (mouse_check_button_pressed(mb_left) and Map[?"触碰"])
	{
				#region 	//保存文件夹
				
				
		ini_open("本地地图/"+string(oGame.MapInfo[?"本地ID"])+"/MapInfo.ini")
			{
				oGame.MapInfo[?"修改次数"]+=1
			ini_write_string("信息","地图信息",ds_map_write(oGame.MapInfo))
			}
			ini_close()
			
		#endregion
		 		#region 	//保存备份用
			
			ini_open("本地地图/"+string(oGame.MapInfo[?"本地ID"])+"/备份/"+string(oGame.MapInfo[?"修改次数"])+".ini")
			{
			ini_write_string("信息","地图信息",ds_map_write(oGame.MapInfo))
			
			}
			ini_close()
			
		#endregion
				//返回
				MeunMode = "List" ;
	}
	break;
		 #endregion
		 
	    default:
	        // code here
	        break;
	}
	
	#endregion
		#region 返回
			if KeyCheck("取消",0) MeunMode = "List" ;
	#endregion

		
		
		
		#endregion
		break;
    default:
        // code here
        break;
}

