extends CharacterBody3D


const walk_speed = 10
const sprint_speed = 13
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#var velocity = Vector3.ZERO
@onready var camera_rotation = get_node("../CameraController")
var snap_vector = Vector3.DOWN

func _physics_process(delta:float) -> void:
	var move_direction := Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_direction = move_direction.rotated(Vector3.UP,camera_rotation.rotation.y).normalized()
	print(move_direction.rotated(Vector3.UP,camera_rotation.rotation.y).normalized())
	
	var speed = 0
	if (Input.is_action_pressed("sprint")):
		speed = sprint_speed
	if (Input.is_action_pressed("sprint")==false):
		speed = walk_speed
	
	velocity.x = move_direction.x * speed
	velocity.z = move_direction.z * speed
	velocity.y -= gravity * delta
	move_and_slide()

