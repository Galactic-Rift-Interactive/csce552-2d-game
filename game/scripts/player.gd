extends CharacterBody2D

signal hit 

@export var speed = 500
@export var jump_strength = 1200
@export var gravity = 3000

func _ready():
	pass

func _physics_process(delta):
	var sprite = $AnimatedSprite2D
	
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		sprite.flip_h = true
		
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_strength

	if velocity.x == 0:
		sprite.animation = "idle"
		sprite.play()
	else:
		sprite.stop()

	velocity.y += gravity * delta
	move_and_slide()
	
func _on_area_2d_body_entered(body):
	# This is because of some janky stuff I did with the nodes for
	# the player scene. It's a CharacterBody2D which makes dealing
	# with movements super easy but hard to detect collisions so I
	# had to add an Area2D as a child with it's own collision.
	if body.get_name() == "Player":
		return
	get_tree().change_scene_to_file("res://scenes/title.tscn")
		
