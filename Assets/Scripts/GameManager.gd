extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var enemylist 

# Called when the node enters the scene tree for the first time.
func _ready():
	#Engine.set_target_fps(10)
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
	pass

func new_game():
	$HUD.update_score(0)
	$HUD.show_timed_message("Get Ready")
	#todo: create new maze with new enemies, reset player health, new shopping list,...


func game_over():
	$HUD.show_game_over()


func toggle_player():
	$PlayerObject.set_process(!$PlayerObject.is_processing())
	pass
