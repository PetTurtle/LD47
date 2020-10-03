extends Node2D



func _on_Button_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func _on_Button2_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func _on_Button3_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func _on_Button4_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func _on_Button5_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func _on_Button6_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	start_game()


func start_game() -> void:
	get_tree().change_scene("res://Game/Game.tscn");
