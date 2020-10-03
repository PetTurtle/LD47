extends Area2D


export(int) var explosion_radius: int = 2


func _on_ExplodeOnImpact_body_entered(body):
	if body == Globals.player:
		Globals.destructible_tile_map.create_explosion(global_position, explosion_radius)
		get_parent().queue_free()


func _on_ExplodeOnImpact_area_entered(area):
	print("Area")
	Globals.destructible_tile_map.create_explosion(global_position, explosion_radius)
	get_parent().queue_free()
