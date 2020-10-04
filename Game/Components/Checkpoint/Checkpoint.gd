extends Area2D

export(bool) var start_checkpoint: bool = false
export(NodePath) var next_checkpoint_path: NodePath

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var next_checkpoint = get_node(next_checkpoint_path)
onready var audio: RanPitchAudio2D = $RanPitchAudio2D


func _ready():
	if start_checkpoint:
		set_active()
	else:
		_set_inactive()


func set_active() -> void:
	visible = true
	animation_player.play("Active")


func _set_inactive() -> void:
	visible = false
	animation_player.stop()


func _on_Checkpoint_body_shape_entered(_body_id, _body, _body_shape, _area_shape):
	if visible:
		_set_inactive()
		Globals.level.add_time(8)
		next_checkpoint.set_active()
		audio.play_rand()
