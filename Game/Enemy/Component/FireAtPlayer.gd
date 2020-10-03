extends Node2D

export(float) var fire_range: float = 90

onready var turret = get_parent()
onready var player = Globals.player
onready var raycast: RayCast2D = $RayCast2D

func _ready():
	raycast.cast_to.x = fire_range


func _process(_delta):
	if global_position.distance_to(player.global_position) <= fire_range:
		turret.look_at(player.global_position)
		if turret.can_fire() and raycast.get_collider() == player:
			turret.fire()
