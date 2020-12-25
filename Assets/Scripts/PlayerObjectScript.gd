extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gridsize = 32 #


func _move(direction):
    position += gridsize*direction
    pass
    
func _end_turn():
    pass

# Called when the node enters the scene tree for the first time.
func _ready():
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
    _move(direction)
    _end_turn()
    pass
