extends KinematicBody2D

export(float) var move_speed: float = 175
export(float) var turn_speed: float = 2
export(float) var move_damp: float = 0.9

var _velocity := Vector2.ZERO
var _attack1_down := false

onready var turret: Turret = $Turret
onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var fall_audio: RanPitchAudio2D = $RanPitchAudio2D


func _ready():
	Globals.player = self


func _input(event) -> void:
	if event.is_action_pressed("attack1"):
		_attack1_down = true
	elif event.is_action_released("attack1"):
		_attack1_down = false
		
	if _attack1_down and turret.can_fire():
		turret.fire()


func _physics_process(delta) -> void:
	var move_dir: float = Input.get_action_strength("move_forward") - (Input.get_action_strength("move_back") * 0.25)
	var turn_dir: float = Input.get_action_strength("turn_right") - Input.get_action_strength("turn_left")
	
	turret.look_at(get_global_mouse_position())
	rotate(deg2rad(turn_dir * turn_speed))
	_velocity += Vector2(move_dir * move_speed * delta, 0).rotated(rotation)
	_velocity = move_and_slide(_velocity) * move_damp


func _kill() -> void:
	set_process_input(false)
	set_physics_process(false)
	
	

func _on_IsGrounded_fall():
	_kill()
	animation_player.play("Falling")
	fall_audio.play_rand()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Falling":
		Globals.level.end_game()
