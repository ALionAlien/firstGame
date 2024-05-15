extends Node3D


var rotating_camera = false
var prev_mouse_position
var next_mouse_position
var camera_size = 25.0
var target_camera_size = 25.0

func zoom_camera(delta):
	if Input.is_action_just_released('wheel down') and camera_size < 49:
		target_camera_size += 2
	if Input.is_action_just_released('wheel up') and camera_size > 16:
		target_camera_size -= 2
	if (camera_size != target_camera_size):
		camera_size = lerp(camera_size, target_camera_size, 1)
	$Camera3D.size = camera_size

func rotate_camera(delta):
	if (Input.is_action_just_pressed("middle mouse")):
		rotating_camera = true
		prev_mouse_position = get_viewport().get_mouse_position()
	if (Input.is_action_just_released("middle mouse")):
		rotating_camera = false
	
	if (rotating_camera):
		next_mouse_position = get_viewport().get_mouse_position()
		rotate_y((prev_mouse_position.x - next_mouse_position.x) * 3 * delta)
		#print((prev_mouse_position.x - next_mouse_position.x) * 1.2 * delta)
		var pos = $Camera3D.position.z
		print(pos)
		prev_mouse_position = next_mouse_position

func _process(delta):
	zoom_camera(delta)
	rotate_camera(delta)
	
	
