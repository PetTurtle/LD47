extends Area2D

export(bool) var start_checkpoint: bool = false
export(NodePath) var next_checkpoint_path: NodePath

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var next_checkpoint = get_node(next_checkpoint_path)


func _ready():
	if start_checkpoint:
		set_active()


func set_active() -> void:
	visible = true
	animation_player.play("Active")


func _set_inactive() -> void:
	visible = false
	animation_player.stop()


func _on_Checkpoint_body_shape_entered(body_id, body, body_shape, area_shape):
	if visible:
		_set_inactive()
		next_checkpoint.set_active()
