extends Node2D


var tiles = []
var max_width = 12
var max_height = 6

var id = Vector2()	#given by room manager on load

var neighbours = {
	"north": null,
	"west": null,
	"east": null,
	"south": null
}

signal player_entered(roomID, roomPosition)

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
	get_node("Area2D/CollisionShape2D").shape.extents = Vector2((max_width * tile_pixel_width) / 2, (max_height * tile_pixel_width) / 2)
	get_node("Area2D").connect("body_entered", self, "body_entered")
	
func _update_tilemap():
	for y in range(max_height):
		for x in range(max_width):
			if tiles[y][x] == 1:
				tilemap.set_cell(x, y, ground_tile_id)

func body_entered(body):
	if body.is_in_group("playerControlled"):
		emit_signal("player_entered", self.id, self.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
