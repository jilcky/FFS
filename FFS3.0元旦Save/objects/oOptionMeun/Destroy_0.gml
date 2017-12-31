for (var i = 0; i < array_length_1d( MeunButton); ++i) 
{
ds_map_destroy(MeunButton[i])
}




with(oGame){
ini_open("GameSetting.ini")
#region 记录下全局变量
ini_write_string("View","Language",Language)
ini_write_real("volume","BGMvolume",BGMvolume)
ini_write_real("volume","SEvolume",SEvolume)
ini_write_real("View","WindowSize",WindowsSize)
ini_write_real("View","WindowFull",WindowFull)
#endregion
ini_close()
}