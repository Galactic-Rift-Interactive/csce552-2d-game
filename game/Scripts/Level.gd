extends Node2D

func _ready():
	$ScoreTimer.start()
	$HighScoreLabel.text = "High Score: " + str(GameManager.get_high_score())
	
func _on_score_timer_timeout():
	GameManager.score += 1
	$ScoreLabel.text = "Score: " + str(GameManager.score)

func _on_player_hit():
	$ScoreTimer.stop()
	if GameManager.score > GameManager.get_high_score():
		# TODO: do something to show high score
		GameManager.set_high_score()
		GameManager.save() # TODO: Maybe move this somewhere else to not constantly save
	# TODO: show game over menu
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
