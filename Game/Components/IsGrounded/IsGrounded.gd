extends Node2D

signal fall()

export(int) var radius: int = 1

onready var tile_map = Globals.destructible_tile_map.tile_map

var horizontal := Vector2(radius, 0)
var vertical := Vector2(0, radius)

func play():
	set_physics_process(true)


func stop():
	set_physics_process(false)


func _physics_process(_delta):
	if _is_tile_empty(global_position) and _is_tile_empty(global_position + horizontal) and _is_tile_empty(global_position - horizontal) and _is_tile_empty(global_position + vertical) and _is_tile_empty(global_position - vertical):
		emit_signal("fall")
		stop()

func _is_tile_empty(point: Vector2) -> bool:
	return tile_map.get_cellv(tile_map.world_to_map(point)) == -1
