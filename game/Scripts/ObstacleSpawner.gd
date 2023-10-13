extends Node2D

@export var obstacle_scene: PackedScene
@export var obstacle_speed = 500

enum SpawnLocations {
	TOP,
	MIDDLE,
	BOTTOM
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$ObstacleSpawnTimer.start()

func pause():
	$ObstacleSpawnTimer.stop()
	for child in get_children():
		if child.name == "Obstacle" and child is RigidBody2D:
			child.linear_velocity = Vector2.ZERO
			child.get_node("AnimatedSprite2D").stop()
			
func resume():
	$ObstacleSpawnTimer.start()
	for child in get_children():
		if child.name == "Obstacle" and child is RigidBody2D:
			child.linear_velocity = Vector2(-obstacle_speed, 0)
			child.get_node("AnimatedSprite2D").play()

func _on_obstacle_spawn_timer_timeout():
	var obstacle = obstacle_scene.instantiate()
	var obstacle_sprite = obstacle.get_node("AnimatedSprite2D")
	var spawn_location = $BottomSpawner
	
	var random_spawner = randi() % 3
	if random_spawner == SpawnLocations.BOTTOM:
		# Originally it was just randi() % 2 and if it's == 0 or 1
		# but for some reason you'd sometimes just only get one
		# sprite so changed to a larger range
		var crate_or_spike = randi() % 10
		if crate_or_spike >= 5:
			obstacle_sprite.animation = "crate"
			obstacle.type = "crate"
		else:
			obstacle_sprite.animation = "spike"
			obstacle.type = "spike"
	elif random_spawner == SpawnLocations.MIDDLE:
		spawn_location = $MiddleSpawner
		obstacle_sprite.animation = "bird"
		obstacle.type = "bird"
	else:
		spawn_location = $TopSpawner
		obstacle_sprite.animation = "bird"
		obstacle.type = "bird"
		
	obstacle_sprite.flip_h = true
		
	obstacle.position = spawn_location.position
	obstacle.linear_velocity = Vector2(-obstacle_speed, 0)
	
	add_child(obstacle)
