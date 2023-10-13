extends Node2D

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/title.tscn")


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
