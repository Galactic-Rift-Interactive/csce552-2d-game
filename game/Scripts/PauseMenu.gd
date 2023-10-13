extends Node2D

var level: Node2D
var is_paused = false

func _ready():
	level = get_node("../")

func toggle_pause():
	if is_paused:
		hide()
		level.resume()
	else:
		level.pause()
		show()
	is_paused = !is_paused

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		toggle_pause()

func _on_resume_pressed():
	hide()
	level.resume()

func _on_menu_pressed():
	hide()
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
