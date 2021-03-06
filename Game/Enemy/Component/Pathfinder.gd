extends Node2D

export(float) var idle_seed: float = 20
export(bool) var follow_player: bool = false
export(float) var follow_distance: float = 80
export(float) var follow_speed: float = 20

onready var player = Globals.player
onready var destructible_tile_map = Globals.destructible_tile_map
onready var repath_timer: Timer = $RepathTimer
onready var speed: float = idle_seed

var path : = PoolVector2Array() setget set_path


func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	var move_distance = speed * delta
	_move_along_path(move_distance)


func _move_along_path(distance : float) -> void:
	var start_point = get_parent().position
	for _i in range(path.size()):
		var distance_to_next = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			get_parent().look_at(path[0])
			get_parent().position = start_point.linear_interpolate(path[0], distance/distance_to_next)
			break
		elif distance < 0.0:
			get_parent().position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)


func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	#var line = Line2D.new()
	#get_tree().root.add_child(line)
	#line.points = value
	#line.width = 1
	set_process(true)


func _on_RepathTimer_timeout():
	var target: Vector2
	
	if follow_player and global_position.distance_to(player.global_position) <= follow_distance:
		target = player.global_position
		repath_timer.start(0.25)
		speed = follow_speed
	else:
		target = destructible_tile_map.get_open_position()
		repath_timer.start(2)
		speed = idle_seed
	
	set_path(destructible_tile_map.navigation.get_simple_path(get_parent().position, target))
	


func _on_Enemy_spawned():
	repath_timer.start()


func _on_Enemy_fell():
	repath_timer.stop()
	set_process(false)
