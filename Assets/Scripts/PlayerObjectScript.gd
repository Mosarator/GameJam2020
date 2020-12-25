extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gridsize = 32 #


func _move(direction):
    position += GameConstants.GRIDSIZE*direction
    GameManager.use_me()
    pass
    
func start_turn():
    # enable Player Input
    # etc.
    pass
    
func _end_turn():
    # disable player input
    # call enemies turn
    GameManager.start_enemies_turn()
    pass

# Called when the node enters the scene tree for the first time.
func _ready():
    GameManager.player = self
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var direction = Vector2(0,0)
    if Input.is_action_just_pressed("ui_up"):
        direction.y = -1
    elif Input.is_action_just_pressed("ui_down"):
        direction.y = 1
    elif Input.is_action_just_pressed("ui_left"):
        direction.x = -1
    elif Input.is_action_just_pressed("ui_right"):
        direction.x = 1
    if(direction.length()>0):
        _move(direction)
        _end_turn()
    pass
