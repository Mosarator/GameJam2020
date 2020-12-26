extends Camera2D

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player=get_node("../PlayerObject")
	set_process_internal(true)


#Still jittering!
func _process (_delta ):
	global_position=Vector2(floor(player.position.x),floor(player.position.y))

