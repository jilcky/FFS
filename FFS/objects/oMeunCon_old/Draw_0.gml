//draw_clear(c_blue)
/*
if keyboard_check_pressed(vk_enter){

ini_open("记录.ini")
//for (var i = 13; i < 22; ++i) {
  with(all){
ID = ini_read_real("Info","ID",0)
ini_write_real(ID,"x",x)
ini_write_real(ID,"y",y)
ini_write_real(ID,"sprite_index",sprite_index)
ini_write_real(ID,"object_index",object_index)
ini_write_string(ID,"Name",object_get_name(object_index))

if variable_instance_exists(id,"Cx")
ini_write_string(ID,"Cx",Cx)

if variable_instance_exists(id,"Cy")
ini_write_string(ID,"Cy",Cy)
ini_write_real("Info","ID",ID+1)

}

//}

ini_close()
Lock = true
}