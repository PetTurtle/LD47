class_name Bullet
extends Area2D

export(float) var move_speed: float = 100
export(int) var explosion_size: int = 2
export(float) var delete_time: float = 10

var exploded: bool = false

onready var delete_timer: Timer = $DeleteTimer
onready var audio: RanPitchAudio2D = $RanPitchAudio2D
onready var explode_player: AnimationPlayer = $ExplodePlayer

func _ready():
	delete_timer.wait_time = delete_time
	delete_timer.start(delete_time)

func _physics_process(delta) -> void:
	position += (Vector2.RIGHT * move_speed * delta).rotated(rotation)


func explode() -> void:
	set_physics_process(false)
	explode_player.play("explode")
	audio.play_rand()
	exploded = true

func _on_DeleteTimer_timeout():
	if !explode():
		Globals.destructible_tile_map.create_explosion(position, explosion_size)
		explode()


func _on_Bullet_body_shape_entered(_body_id, body, _body_shape, _area_shape):
	if !explode():
		if body is RigidBody2D or body is KinematicBody2D:
			Globals.destructible_tile_map.create_explosion(body.position, explosion_size)
			if body.has_method("_on_IsGrounded_fall"):
				body._on_IsGrounded_fall()
		else:
			Globals.destructible_tile_map.create_explosion(position, explosion_size)
		explode()


func _on_ExplodePlayer_animation_finished(anim_name):
	if anim_name == "explode":
		queue_free()
