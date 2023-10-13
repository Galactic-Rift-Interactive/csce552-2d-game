extends Node2D

var score = 0
@onready var game_start_timer = Time.get_ticks_msec()

func _ready():
	$ScoreTimer.start()
	$HighScoreLabel.text = "High Score: " + str(GameManager.get_high_score())
	
func _on_score_timer_timeout():
	score += 1
	$ScoreLabel.text = "Score: " + str(score)

func _on_player_hit():
	$ScoreTimer.stop()
	if score > GameManager.get_high_score():
		# TODO: do something to show high score
		GameManager.set_high_score(score)
		GameManager.save() # TODO: Maybe move this somewhere else to not constantly save
	# TODO: show game over menu
	get_tree().change_scene_to_file("res://Scenes/title.tscn")

func _process(delta):
	$stopWatch.text = get_time()

func get_time():
	var current_time = Time.get_ticks_msec() - game_start_timer
	var mins = current_time / 1000 / 60
	var secs = current_time / 1000 % 60
	var msec = current_time % 1000 / 10
	
	if mins < 10:
		mins = "0" + str(mins)
	if secs < 10:
		secs = "0" + str(secs)
	if msec < 10:
		if msec == 0:
			msec = "00"
		else:
			msec = "0" + str(msec)
	
	return str(mins) + ":" + str(secs) + ":" + str(msec)
