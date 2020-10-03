extends Node2D

export(NodePath) var tile_map_path: NodePath

onready var tile_map: TileMap = get_node(tile_map_path)

func _ready():
	Globals.destructible_tile_map = self


func create_explosion(point: Vector2, radius: int) -> void:
	var map_point := tile_map.world_to_map(point)
	_explosion_recursion(int(map_point.x), int(map_point.y), radius)


func _explosion_recursion(x: int, y: int, charges: int) -> void:
	if charges <= 0:
		return
	
	tile_map.set_cell(x, y, -1)
	_explosion_recursion(x + 1, y, charges - 1)
	_explosion_recursion(x - 1, y, charges - 1)
	_explosion_recursion(x, y + 1, charges - 1)
	_explosion_recursion(x, y - 1, charges - 1)
