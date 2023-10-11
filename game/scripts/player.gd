extends RigidBody2D

signal hit 

@export var speed = 500
@export var jump_strength = 400
var screen_size
var screen

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	rotation_degrees = 0

	var horizontal_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var force = Vector2(speed * horizontal_input, 0)
	
	var sprite = $AnimatedSprite2D

	if force == Vector2.ZERO:
		sleeping = true
	else:
		sleeping = false
		apply_central_force(force)
	
	#position = position.clamp(Vector2.ZERO, screen_size)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_test_obstacle_body_entered(body):
	print("obstacle enter")
	if body.get_name() == "Player":
		print("player")


func _on_body_entered(body):
	print("enter")
	pass # Replace with function body.
