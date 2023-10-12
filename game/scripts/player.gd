extends CharacterBody2D

signal hit 

@export var speed = 500
@export var jump_strength = 1200
@export var gravity = 3000

func _ready():
	pass

func _physics_process(delta):
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_strength

	var sprite = $AnimatedSprite2D
	if velocity.x == 0:
		sprite.animation = "idle"
		sprite.play()
	else:
		sprite.stop()

	velocity.y += gravity * delta
	move_and_slide()
	
