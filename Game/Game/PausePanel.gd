extends Panel


onready var map_label: Label = $VBoxContainer/VBoxContainer/GridContainer/Map
onready var diff_label: Label = $VBoxContainer/VBoxContainer/GridContainer/ModeLabel2
onready var score_label: Label = $VBoxContainer/VBoxContainer/GridContainer/Score
onready var time_label: Label = $VBoxContainer/VBoxContainer/GridContainer/TotalTime

func _input(event):
	if event.is_action_pressed("pause") and Globals.level.game_over == false:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
		
		if visible:
			map_label.set_text(String(Globals.levelID))
			diff_label.set_text(Globals.difficulty_name)
			score_label.set_text(String(Globals.level.total_score))
			time_label.set_text(String(Globals.level.time_passed))


func _on_Return_pressed():
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused


func _on_Exit_pressed():
	get_tree().paused = false
	Globals.level.exit()
