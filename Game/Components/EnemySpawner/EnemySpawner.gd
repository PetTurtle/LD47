extends Node2D

export(Array) var enemy_prefabs_paths: Array

var enemy_prefabs: Array
var parachute_prefab := load("res://Components/Parachute/Parachute.tscn")

onready var spawn_timer: Timer = $SpawnTimer

func _ready():
	for path in enemy_prefabs_paths:
		enemy_prefabs.append(load(path))


func _on_SpawnTimer_timeout():
	var spawn_position = Globals.destructible_tile_map.get_open_position()
	var parachute = parachute_prefab.instance()
	Globals.level.add_child(parachute)
	parachute.position = spawn_position
	parachute.deploy(enemy_prefabs[rand_range(0, enemy_prefabs.size())])
