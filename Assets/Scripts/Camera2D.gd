extends Camera2D

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player=get_node("../PlayerObject")
	
	#Todo: how to move under title screen?
	#Todo: move back as player child, script useless atm
func _process (_delta ):
	global_position=player.position
	pass

