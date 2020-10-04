extends AudioStreamPlayer

var pause := false


func _ready():
	play()
	
func _input(event):
	if event.is_action_pressed("music_pause"):
		pause = !pause
		self.playing = !self.playing
	elif event.is_action_pressed("music_up"):
		volume_db += 0.25
	elif event.is_action_pressed("music_down"):
		volume_db -= 0.25

func _on_MusicPlayer_finished():
	if !pause:
		play()
