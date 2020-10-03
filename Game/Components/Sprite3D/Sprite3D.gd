extends Sprite

export(Vector2) var texture_offset := Vector2(0, 1)

func _ready():
	texture = get_parent().texture


func _process(delta):
	global_position = get_parent().global_position + texture_offset
