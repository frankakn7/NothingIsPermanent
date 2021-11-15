extends Node2D


var tiles = []
var max_width = 12
var max_height = 6

onready var tilemap = $TileMap
onready var ground_tile_id = 0
# TODO: Find this out programmatically
onready var tile_pixel_width = 64

func _ready():
	# Initialize the tiles
	# Later on when we get to more complex generation empty spaces will be set to 0's
	for y in range(max_height):
		tiles.append([])
		for x in range(max_width):
			tiles[y].append(x)
			tiles[y][x] = 1
	_update_tilemap()
	
func _update_tilemap():
	for y in range(max_height):
		for x in range(max_width):
			if tiles[y][x] == 1:
				tilemap.set_cell(x, y, ground_tile_id)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
