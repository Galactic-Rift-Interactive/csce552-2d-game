extends Node2D

func _on_play_pressed(): # Play button is pressed on the main title screen
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_quit_pressed(): # Quit button is pressed on the main title screen
	get_tree().quit()
