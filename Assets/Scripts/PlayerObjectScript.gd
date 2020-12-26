extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gridsize = 32 #
var sprite_state=true

func _move(direction):
	position += GameConstants.GRIDSIZE*direction
	GameManager.use_me()
	$Sprite.flip_h = direction.x ==-1
	$Sprite2.flip_h = direction.x ==-1
	change_sprite()
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
	set_process(false)
	$Sprite2.hide()
	#todo:remove
	z_index=7
	pass # Replace with function body.

func change_sprite():
	if(sprite_state):
		$Sprite.show()
		$Sprite2.hide()
		sprite_state=false
	else:
		$Sprite2.show()
		$Sprite.hide()
		sprite_state=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
