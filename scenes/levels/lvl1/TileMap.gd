extends TileMap


func remove_wall(pos):
	var grid_pos = world_to_map(pos)
	if get_cell(grid_pos.x,grid_pos.y) == 23 && global.weapon == "CRASH":
		set_cell(grid_pos.x,grid_pos.y,-1)
	
	
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
