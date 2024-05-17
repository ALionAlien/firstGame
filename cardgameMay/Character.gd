extends CharacterBody3D

var speed = 2
var accel = 10

@onready var nav: NavigationAgent3D = $NavigationAgent3D

func _physics_process(delta):
	var direction = Vector3()
	var player_position = get_node("/root/Game/CameraController")
	nav.target_position = player_position.position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed , accel * delta)
	
	move_and_slide()
