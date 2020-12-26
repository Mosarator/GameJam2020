extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func start_turn():
	# Beispiel:
	# Suche Spieler position
	# Bestimme in welche Richtung ich mich bewegen muss
	# Bewege dich in die Richtung
	var player = GameManager.player
	var direction = Vector2()
	direction = player.position - self.position
	direction = direction.normalized()
	position += direction*GameConstants.GRIDSIZE
	end_turn()
	pass
	
func end_turn():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.enemylist.append(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
