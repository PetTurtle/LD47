extends Node2D


var deploy_prefab

onready var animtation_player: AnimationPlayer = $AnimationPlayer


func deploy(scene_prefab) -> void:
	deploy_prefab = scene_prefab


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Landing":
		var deploy_node : Node2D = deploy_prefab.instance()
		Globals.level.add_child(deploy_node)
		deploy_node.global_position = self.global_position
		deploy_node.show_behind_parent = true
		animtation_player.play("Unloading")
	elif anim_name == "Unloading":
		queue_free()
