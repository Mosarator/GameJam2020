extends Node2D

var start_pos 
var player
var enemylist 

var test = true
#Todo: Remove from utoload, to prevent double loading?

# Called when the node enters the scene tree for the first time.
func _ready():
	#Console.add_command("game_over", self, 'game_over')\
		#.set_description("You just lost the game, boomer")\
		#.register()
	print("This text should appear only once, but appears twice")
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
	if(test):
		Console.add_command("game_over", self, 'game_over')\
			.set_description("You just lost the game, boomer")\
			.register()
		test=false
	$"/root/MazeGen".generate_debug_maze()
	start_pos = $"/root/MazeGen"._get_position_of_maze_tile(Vector2(1,1))-Vector2(0,16)
	$PlayerObject.position=start_pos
	$PlayerObject/Sprite2.hide()
	$PlayerObject/Sprite.show()
	$HUD.update_score(0)
	$HUD.show_timed_message("Get Ready")
	#todo: create new maze with new enemies, reset player health, new shopping list,...
	#Todo: Create prepare game function, which will be called, before start button is pressed and after player died

#Todo: Some trigger when return to title is used, maybe send a signal

func game_over():
	$HUD.show_game_over()

func toggle_player():
	$PlayerObject.set_process(!$PlayerObject.is_processing())
	pass
