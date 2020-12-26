extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum Maze {
	WALL,
	FLOOR,
	START,
	EXIT,
	ITEM
}

var maze_data
var maze_node

var tile_offset_y
var tile_offset_x

var maze_width = 50
var maze_height = 32

var rng = RandomNumberGenerator.new()

func generate_debug_maze():
	# clear a maze if one exists
	clear_maze()
	
	# create an empty maze node
	maze_node = Node.new()
	maze_node.set_name("MazeRoot")
	get_node('/root').add_child(maze_node)
	
	# initialize array with data
	maze_data = _create_empty_array(maze_width, maze_height)
	
	# fill maze
	maze_data = _generate_maze_data()
	
	# instance nodes to draw the maze
	_draw_maze()
	
func clear_maze():
	Console.write_line('Clearing existing maze:')
	var maze = get_node("/root/MazeRoot")
	if maze != null:
		Console.write_line('Found a maze and deleted it.')
		maze.queue_free()
		return
	Console.write_line('No maze found.')

# Called when the node enters the scene tree for the first time.
func _ready():
	Console.add_command("generate_new_maze", self, 'generate_debug_maze')\
		.set_description("Generates a new debug maze.")\
		.register()
	Console.add_command("clear_maze", self, 'clear_maze')\
		.set_description("Clears the current maze if one exists.")\
		.register()	
	var screensize = Vector2(1920, 1080)
	tile_offset_x = (screensize.x - (maze_width * GameConstants.GRIDSIZE)) / 2 #+ GameConstants.GRIDSIZE/2
	tile_offset_y = GameConstants.GRIDSIZE/2
	
	# initialize RNG
	rng.randomize()
	pass # Replace with function body.

func _create_empty_array(w, h):
	"""
	returns a two dimensional array with w width and h height
	null initialized
	"""
	var map = []
	for _x in range(w):
		var col = []
		col.resize(h)
		map.append(col)
	return map
	
func _generate_maze_data():
	# fill everything with floor	
	for w in range(maze_width):
		for h in range(maze_height):
			maze_data[w][h] = Maze.FLOOR
	# fill top and bottom row with walls
	for w in range(maze_width):
		maze_data[w][0] = Maze.WALL
		maze_data[w][maze_height-1] = Maze.WALL
	# fill left and right columns with walls
	for h in range(maze_height):
		maze_data[0][h] = Maze.WALL
		maze_data[maze_width-1][h] = Maze.WALL
	maze_data[3][3] = Maze.WALL
	
	# place player start top left
	maze_data[1][1] = Maze.START
	
	# place exit bottom right
	maze_data[maze_width-2][maze_height-2] = Maze.EXIT
	
	# place five random items 
	for _i in range(5):
		_place_item()
	return maze_data
	
func _draw_maze():
	for x in range(maze_width):
		for y in range(maze_height):
			# get the correct sprites of the maze based on the tile information
			var sprite_type = maze_data[x][y]
			if sprite_type == null:
				# nothing here
				continue
			var sprite = Sprite.new()
			sprite.texture = _load_maze_sprite(sprite_type)
			maze_node.add_child(sprite)
			sprite.position = _get_position_of_maze_tile(Vector2(x, y))
			
func _get_position_of_maze_tile(pos):
	var x = pos.x * GameConstants.GRIDSIZE + tile_offset_x
	var y = pos.y * GameConstants.GRIDSIZE + tile_offset_y
	return Vector2(x, y)
			
func _load_maze_sprite(sprite_type):
	match sprite_type:
		Maze.WALL: return load("res://Assets/Images/MazeDebug/wall.png")
		Maze.FLOOR: return load("res://Assets/Images/MazeDebug/tile.png")
		Maze.ITEM: return load("res://Assets/Images/MazeDebug/item.png")
		Maze.START: return load("res://Assets/Images/MazeDebug/start.png")
		Maze.EXIT: return load("res://Assets/Images/MazeDebug/exit.png")
	return load("res://Assets/Images/MazeDebug/error.png")

func _place_item():
	var pos = Vector2(rng.randi_range(1, maze_width-2), rng.randi_range(1, maze_height-2))
	while maze_data[pos.x][pos.y] != Maze.FLOOR:
		pos = Vector2(rng.randi_range(1, maze_width-2), rng.randi_range(1, maze_height-2))
	maze_data[pos.x][pos.y] = Maze.ITEM

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
