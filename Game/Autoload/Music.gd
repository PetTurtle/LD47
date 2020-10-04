extends Node

onready var music_player_prefab = load("res://Components/MusicPlayer/MusicPlayer.tscn")


func _ready():
	var music_player = music_player_prefab.instance()
	add_child(music_player)
