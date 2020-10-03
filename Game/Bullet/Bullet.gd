class_name Bullet
extends Area2D

export(float) var move_speed: float = 100


func _physics_process(delta) -> void:
	position += (Vector2.RIGHT * move_speed * delta).rotated(rotation)
