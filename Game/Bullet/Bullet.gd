class_name Bullet
extends Area2D

export(float) var move_speed: float = 100
export(int) var explosion_size: int = 2
export(float) var delete_time: float = 10

onready var delete_timer: Timer = $DeleteTimer

func _ready():
	delete_timer.wait_time = delete_time
	delete_timer.start(delete_time)

func _physics_process(delta) -> void:
	position += (Vector2.RIGHT * move_speed * delta).rotated(rotation)


func _on_DeleteTimer_timeout():
	Globals.destructible_tile_map.create_explosion(position, explosion_size)
	queue_free()


func _on_Bullet_body_shape_entered(_body_id, body, _body_shape, _area_shape):
	if body is RigidBody2D or body is KinematicBody2D:
		Globals.destructible_tile_map.create_explosion(body.position, explosion_size)
	else:
		Globals.destructible_tile_map.create_explosion(position, explosion_size)
	queue_free()
