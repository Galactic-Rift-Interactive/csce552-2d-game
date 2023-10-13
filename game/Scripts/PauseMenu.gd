extends Node2D

func toggle_pause():
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		show()
	else:
		hide()

func _input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		toggle_pause()

func _on_resume_pressed():
	toggle_pause()

func _on_menu_pressed():
	hide()
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
	toggle_pause()
