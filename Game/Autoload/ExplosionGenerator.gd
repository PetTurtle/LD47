extends Node2D

onready var explosion_prefab = load("res://Components/Explosion/Explosion.tscn")

func create_explosion(point: Vector2) -> void:
	var explosion = explosion_prefab.instance()
	Globals.level.add_child(explosion)
	explosion.position = point
