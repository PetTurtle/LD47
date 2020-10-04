extends Node2D

onready var particles: CPUParticles2D = $Particles2D
onready var particles2: CPUParticles2D = $Particles2D2
onready var audio: RanPitchAudio2D = $RanPitchAudio2D


func _ready():
	particles.emitting = true
	particles2.emitting = true
	audio.play_rand()


func _on_Timer_timeout():
	queue_free()
