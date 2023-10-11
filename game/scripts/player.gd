extends Area2D

signal hit 

@export var speed = 400
@export var jump_strength = 400
var screen_size
var screen

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta): 
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("jump"):
		pass
	
	var sprite = $AnimatedSprite2D
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		sprite.play()
	else:
		sprite.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


	
func _on_body_entered(_body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
