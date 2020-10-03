extends Panel

onready var score_label: Label = $VBoxContainer/VBoxContainer/GridContainer/Score
onready var time_label: Label = $VBoxContainer/VBoxContainer/GridContainer/TotalTime

func _on_LossPanel_visibility_changed():
	if visible == true:
		get_tree().paused = true
		score_label.set_text(String(Globals.level.total_score))
		time_label.set_text(String(Globals.level.time_passed))


func _on_Replay_pressed():
	get_tree().paused = false
	var _ok = get_tree().change_scene("res://Game/Game.tscn");


func _on_Exit_pressed():
	get_tree().paused = false
	Globals.level.exit()
