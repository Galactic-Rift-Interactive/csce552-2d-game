extends Node2D

var sounds = {

}

func _ready():
	$BackgroundMusic.play()
	
	sounds = {
		"crate": load("res://Sounds/crate.mp3"),
		"spike": load("res://Sounds/spike.mp3"),
		"bird": load("res://Sounds/bird.mp3"),
		"jump": load("res://Sounds/jump.mp3"),
		"swoosh": load("res://Sounds/swoosh.mp3"),
	}

func play_sound(sound):
	var audio = sounds.get(sound)
	if audio == null:
		return
	$SoundPlayer.stream = audio
	$SoundPlayer.play()
