extends Node2D

func _ready():
	$high_score.text = "High Score: " + str(GameManager.get_high_score())
	$score.text = "Score: " + str(GameManager.score)

func _on_play_pressed(): # Play button is pressed on the main title screen
	GameManager.score = 0
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_quit_pressed(): # Quit button is pressed on the main title screen
	get_tree().quit()
