class_name Turret
extends Node2D

export(float) var reload_time: float = 1
export(String) var bullet_path: String = ""
export(Array) var shot_point_paths: Array

var shot_points: Array
var curr_shot_point_id: int = 0

onready var bullet_prefab = load(bullet_path)
onready var reload_timer: Timer = $ReloadTimer

func _ready():
	for path in shot_point_paths:
		shot_points.append(get_node(path))

func fire() -> void:
	if reload_timer.time_left > 0:
		return
	
	var bullet = bullet_prefab.instance()
	get_tree().root.add_child(bullet)
	bullet.rotation = global_rotation
	bullet.position = to_global(shot_points[curr_shot_point_id].position)
	curr_shot_point_id = (curr_shot_point_id + 1) % shot_points.size()

	reload_timer.start(reload_time)

func can_fire() -> bool:
	return reload_timer.time_left == 0
