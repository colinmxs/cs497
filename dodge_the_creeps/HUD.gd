extends CanvasLayer

signal start_game
var paused = false

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()

func show_game_over():
    $PauseButton.hide()
    show_message("Game Over")
    yield($MessageTimer, "timeout")
    $MessageLabel.text = "Dodge the\nCreeps!"
    $MessageLabel.show()
    yield(get_tree().create_timer(1), 'timeout')
    $StartButton.show()

func update_score(score):
    $ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
    $MessageLabel.hide()

func _on_StartButton_pressed():
    $StartButton.hide()
    $PauseButton.show()
    emit_signal("start_game")

func _on_PauseButton_toggled(button_pressed):
	if button_pressed == true:
		$PauseButton.text = "Play"
		get_tree().paused = true
	else: 
		get_tree().paused = false
		$PauseButton.text = "Pause"
