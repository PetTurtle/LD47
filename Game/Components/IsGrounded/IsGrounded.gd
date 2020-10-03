extends Area2D

signal fall()

func _on_IsGrounded_body_exited(_body) -> void:
	if get_overlapping_bodies().size() <= 1:
		emit_signal("fall")
