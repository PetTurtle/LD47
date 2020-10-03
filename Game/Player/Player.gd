extends KinematicBody2D

export(float) var move_speed: float = 175
export(float) var turn_speed: float = 2
export(float) var move_damp: float = 0.9
export(NodePath) var turret_path: NodePath

var _velocity := Vector2.ZERO
var _attack1_down := false

onready var turret: Turret = get_node(turret_path) as Turret

func _input(event) -> void:
	if event.is_action_pressed("attack1"):
		_attack1_down = true
	elif event.is_action_released("attack1"):
		_attack1_down = false
		
	if _attack1_down and turret.can_fire():
		turret.fire()

func _physics_process(delta) -> void:
	var move_dir: float = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	var turn_dir: float = Input.get_action_strength("turn_right") - Input.get_action_strength("turn_left")
	
	turret.look_at(get_global_mouse_position())
	rotate(deg2rad(turn_dir * turn_speed))
	_velocity += Vector2(move_dir * move_speed * delta, 0).rotated(rotation)
	_velocity = move_and_slide(_velocity) * move_damp
