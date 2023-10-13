extends RigidBody2D

@export var type: String

func _ready():
	$AnimatedSprite2D.play()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
