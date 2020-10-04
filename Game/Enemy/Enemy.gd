class_name Enemy
extends RigidBody2D

signal spawned()
signal fell()

var fell: bool = false
onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	emit_signal("spawned")


func _on_IsGrounded_fall():
	if !fell:
		fell = true
		animation_player.play("fall")
		emit_signal("fell")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fall":
		queue_free()
