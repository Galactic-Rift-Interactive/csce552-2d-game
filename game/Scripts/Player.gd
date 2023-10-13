extends CharacterBody2D

signal hit

@export var speed = 500
@export var jump_strength = 1200
@export var gravity = 3000

@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta):
	var sprite = $AnimatedSprite2D
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_strength
			Audio.play_sound("jump")
			anim.play("Jump")
	
	if Input.is_action_just_pressed("duck") || Input.is_action_just_released("duck"):
		Audio.play_sound("swoosh")
			
	velocity.x = 0
	if Input.is_action_pressed("duck"):
		# TODO: Duck animation
		pass
	else:
		if Input.is_action_pressed("move_right"):
			velocity.x = speed
			sprite.flip_h = false
			if velocity.y == 0 && is_on_floor():
				anim.play("Run")
		elif Input.is_action_pressed("move_left"):
			velocity.x = -speed
			sprite.flip_h = true
			if velocity.y == 0 && is_on_floor():
				anim.play("Run")
		elif velocity.y == 0 && is_on_floor():
			anim.play("Idle")

	if velocity.y > 0:
		anim.play("Fall")

	move_and_slide()
	
func _on_area_2d_body_entered(body):
	# This is because of some janky stuff I did with the nodes for
	# the player scene. It's a CharacterBody2D which makes dealing
	# with movements super easy but hard to detect collisions so I
	# had to add an Area2D as a child with it's own collision.
	if body.get_name() != "Obstacle":
		return
	Audio.play_sound(body.type)
	hit.emit()
