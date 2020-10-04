extends Node2D

onready var easy_button: Button = $CanvasLayer/Control/VBoxContainer/Difficulty/HBoxContainer2/Easy
onready var medium_button: Button = $CanvasLayer/Control/VBoxContainer/Difficulty/HBoxContainer2/Medium
onready var hard_button: Button = $CanvasLayer/Control/VBoxContainer/Difficulty/HBoxContainer2/Hard

func _ready():
	if Globals.difficulty == 10:
		easy_button.pressed = true
		medium_button.pressed = false
		hard_button.pressed = false
		Globals.difficulty_name = "Easy"
	elif Globals.difficulty == 7:
		easy_button.pressed = false
		medium_button.pressed = true
		hard_button.pressed = false
		Globals.difficulty_name = "Medium"
	elif Globals.difficulty == 4:
		easy_button.pressed = false
		medium_button.pressed = false
		hard_button.pressed = true
		Globals.difficulty_name = "Hard"

func _on_Button_pressed():
	Globals.level_path = "res://Levels/Level1.tscn"
	Globals.levelID = 1
	start_game()


func _on_Button2_pressed():
	Globals.level_path = "res://Levels/Level2.tscn"
	Globals.levelID = 2
	start_game()


func _on_Button3_pressed():
	Globals.level_path = "res://Levels/Level3.tscn"
	Globals.levelID = 3
	start_game()


func _on_Button4_pressed():
	Globals.level_path = "res://Levels/Level4.tscn"
	Globals.levelID = 4
	start_game()


func _on_Button5_pressed():
	Globals.level_path = "res://Levels/Level5.tscn"
	Globals.levelID = 5
	start_game()


func _on_Button6_pressed():
	Globals.level_path = "res://Levels/Level6.tscn"
	Globals.levelID = 6
	start_game()


func start_game() -> void:
	var _ok = get_tree().change_scene("res://Game/Game.tscn");


func _on_Easy_pressed():
	Globals.difficulty = 10
	#easy_button.pressed = true
	medium_button.pressed = false
	hard_button.pressed = false
	Globals.difficulty_name = "Easy"


func _on_Medium_pressed():
	Globals.difficulty = 7
	easy_button.pressed = false
	#medium_button.pressed = true
	hard_button.pressed = false
	Globals.difficulty_name = "Medium"


func _on_Hard_pressed():
	Globals.difficulty = 4
	easy_button.pressed = false
	medium_button.pressed = false
	#hard_button.pressed = true
	Globals.difficulty_name = "Hard"


func _on_ButtonExit_pressed():
	get_tree().quit()
