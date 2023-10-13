extends Node2D

func _on_play_pressed(): # Play button is pressed on the main title screen
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func _on_quit_pressed(): # Quit button is pressed on the main title screen
	get_tree().quit()


func _on_help_pressed():
	get_tree().change_scene_to_file("res://Scenes/help.tscn")
