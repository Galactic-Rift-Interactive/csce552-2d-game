extends Node2D

var score = 0

func _ready():
	$ScoreTimer.start()
	
func pause():
	$Player.pause()
	$ObstacleSpawner.pause()
	$ScoreTimer.stop()
	
func resume():
	$Player.resume()
	$ObstacleSpawner.resume()
	$ScoreTimer.start()

func _on_score_timer_timeout():
	score += 1

func _on_player_hit():
	$ScoreTimer.stop()
	if score > GameManager.get_high_score():
		# TODO: do something to show high score
		GameManager.set_high_score(score)
		GameManager.save() # TODO: Maybe move this somewhere else to not constantly save
	# TODO: show game over menu
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
