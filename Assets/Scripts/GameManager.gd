extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var enemylist 


# Called when the node enters the scene tree for the first time.
func _ready():
	if enemylist == null:
		enemylist = []
	pass # Replace with function body.

func start_player_turn():
	pass
	
func start_enemies_turn():
	for enemy in enemylist:
		enemy.start_turn()
	pass

func use_me():
	print("daddy")
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
