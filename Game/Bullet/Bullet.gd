class_name Bullet
extends Area2D

export(float) var move_speed: float = 100
export(int) var explosion_size: int = 2


func _physics_process(delta) -> void:
	position += (Vector2.RIGHT * move_speed * delta).rotated(rotation)


func _on_DeleteTimer_timeout():
	Globals.destructible_tile_map.create_explosion(position, explosion_size)
	queue_free()


func _on_Bullet_body_shape_entered(body_id, body, body_shape, area_shape):
	Globals.destructible_tile_map.create_explosion(position, explosion_size)
	queue_free()
