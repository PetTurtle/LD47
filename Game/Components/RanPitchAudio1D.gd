class_name RanPitchAudio
extends AudioStreamPlayer

export(float) var min_pitch: float = 1
export(float) var max_pitch: float = 1.1

func play_rand() -> void:
	pitch_scale = rand_range(min_pitch, max_pitch)
	play()
