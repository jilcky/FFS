/// 设置结构体

// Enum grid_id
enum grid_id {
	sky = 0,
	block = 1,
	block_push = 2,
	block_fade = 3,
	spring_nor = 4
}

enum gamemode {
	player = 0,
	creator = 1
}

global.CurrentSelection = grid_id.sky; // 玩家当前所选
// Ds_grid map 存储地图数据
global.dg_map = ds_grid_create(room_width div 16, 
				room_height div 16);
global.GameMode = gamemode.creator; //存储游戏模式



