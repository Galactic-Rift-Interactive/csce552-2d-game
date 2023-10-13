extends Node2D


# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().paused = true
		show()

func _on_resume_pressed():
	get_tree().paused = false
	hide()

func _on_menu_pressed():
	get_tree().paused = false
	hide()
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
