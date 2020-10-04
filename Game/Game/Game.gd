extends Node2D

export(int) var start_time: int = 10

export(NodePath) var timer_label_path: NodePath

var game_over: bool = false
var total_score: int = 0

onready var time_passed: int = 0
onready var time_left: int = start_time
onready var timer_label: Label = get_node(timer_label_path)
onready var count_down_timer: Timer = $CountDownTimer
onready var loss_panel: Panel = $CanvasLayer/LossPanel
onready var timer_animation: AnimationPlayer = $TimerAnimation


func _init():
	var level = load(Globals.level_path)
	add_child(level.instance())
	

func _ready():
	Globals.level = self
	randomize()
	update_time_change()
	count_down_timer.start(1)


func add_time(_amount: int) -> void:
	time_left = start_time
	total_score += 1
	update_time_change()


func update_time_change() -> void:
	timer_label.set_text(String(time_left))


func end_game() -> void:
	count_down_timer.stop()
	loss_panel.visible = true


func replay() -> void:
	pass


func exit() -> void:
	var _ok = get_tree().change_scene("res://MainMenu/MainMenu.tscn");


func _on_CountDownTimer_timeout():
	time_left -= 1
	time_passed += 1
	
	if time_left <= 8:
		timer_animation.play("Pulse")
	else:
		timer_animation.stop(true)
	
	if time_left < 0:
		end_game()
	else:
		update_time_change()
