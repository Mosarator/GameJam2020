extends CanvasLayer

signal start_game
signal toggle_player

# Called when the node enters the scene tree for the first time.
func _ready():
	$ReturnToTitleButton.hide()
	Console.add_command("show_title_screen", self, 'show_TitleScreen')\
		.set_description("Retrun to title screen")\
		.register()
		
func show_TitleScreen():
	$StartButton.show()
	$Title.show()
	$TitleBackground.show()
	$ReturnToTitleButton.hide()

	
func hide_TitleScreen():
	$StartButton.hide()
	$Title.hide()
	$TitleBackground.hide()
	$ReturnToTitleButton.show()

	
func _on_StartButton_pressed():
	emit_signal("start_game")
	emit_signal("toggle_player")
	hide_TitleScreen()

func show_game_over():
	emit_signal("toggle_player")
	show_timed_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")
	
	$Message.text = "Back to Menu!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	show_TitleScreen()


func update_score(score):
	$ScoreLabel.text = str(score)


#Shows text message (the shopping list for example)
func show_timed_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func _on_MessageTimer_timeout():
	$Message.hide()


func show_message(text):
	$Message.text = text
	$Message.show()

#hides text message
func hide_message():
	$Message.hide()


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ReturnToTitleButton_pressed():
	emit_signal("toggle_player")
	show_TitleScreen()
