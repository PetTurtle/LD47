extends Area2D


export(int) var explosion_radius: int = 2
export(bool) var explode_on_bullet: bool = true
export(bool) var ignore_bullet: bool = false


func _on_ExplodeOnImpact_body_entered(body):
	if body == Globals.player:
		Globals.destructible_tile_map.create_explosion(global_position, explosion_radius)
		ExplosionGenerator.create_explosion(global_position)
		get_parent().queue_free()


func _on_ExplodeOnImpact_area_entered(area):
	if not ignore_bullet:
		if explode_on_bullet:
			Globals.destructible_tile_map.create_explosion(global_position, explosion_radius)
		ExplosionGenerator.create_explosion(global_position)
		get_parent().queue_free()
		area.queue_free()
