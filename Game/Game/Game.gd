extends Node2D

export(int) var start_time: int = 30

export(NodePath) var timer_label_path: NodePath

onready var time_left: int = start_time
onready var timer_label: Label = get_node(timer_label_path)
onready var count_down_timer: Timer = $CountDownTimer

func _init():
	var level = load(Globals.level_path)
	add_child(level.instance())
	

func _ready():
	Globals.level = self
	randomize()
	update_time_change()
	count_down_timer.start(1)


func add_time(amount: int) -> void:
	time_left += amount
	update_time_change()


func update_time_change() -> void:
	timer_label.set_text(String(time_left))


func _on_CountDownTimer_timeout():
	time_left -= 1
	update_time_change()
