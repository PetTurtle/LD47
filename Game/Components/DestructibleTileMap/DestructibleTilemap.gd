extends Node2D

signal tiles_removed()

export(NodePath) var tile_map_path: NodePath
export(NodePath) var navigationp_path: NodePath

onready var tile_map: TileMap = get_node(tile_map_path)
onready var navigation: Navigation2D = get_node(navigationp_path)

func _ready():
	Globals.destructible_tile_map = self


func create_explosion(point: Vector2, radius: int) -> void:
	var map_point := tile_map.world_to_map(point)
	_explosion_recursion(int(map_point.x), int(map_point.y), radius)
	emit_signal("tiles_removed")


func get_open_position() -> Vector2:
	var map_size = tile_map.get_used_rect()
	var open_point := Vector2(-999, -999)
	while open_point == Vector2(-999, -999):
		var x = rand_range(map_size.position.x, map_size.end.x)
		var y = rand_range(map_size.position.y, map_size.end.y)
		if tile_map.get_cell(x, y) != -1:
			open_point = tile_map.map_to_world(Vector2(x, y))

	return open_point

func _explosion_recursion(x: int, y: int, charges: int) -> void:
	if charges <= 0:
		return
	
	tile_map.set_cell(x, y, -1)
	_explosion_recursion(x + 1, y, charges - 1)
	_explosion_recursion(x - 1, y, charges - 1)
	_explosion_recursion(x, y + 1, charges - 1)
	_explosion_recursion(x, y - 1, charges - 1)
