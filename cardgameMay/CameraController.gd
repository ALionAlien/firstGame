extends Node3D


var prev_mouse_position = Vector2(0,0)
var next_mouse_position  = Vector2(0,0)
var prev_rot : float = 0.0
var rot_difference
var mouse_prev_rotation
var mouse_next_rotation
var camera_size = 25.0
var target_camera_size = 25.0

func zoom_camera(_delta):
	if Input.is_action_just_released('wheel down') and camera_size < 49:
		target_camera_size += 2
	if Input.is_action_just_released('wheel up') and camera_size > 16:
		target_camera_size -= 2
	if (camera_size != target_camera_size):
		camera_size = lerp(camera_size, target_camera_size, 1)
	$Camera3D.size = camera_size


func _process(delta):
	zoom_camera(delta)
	
	if (Input.is_action_just_pressed("middle mouse")):
		prev_mouse_position = get_viewport().get_mouse_position() - $Camera3D.unproject_position($".".position)
		#finds the mouse original position using the screen center as 0,0
		mouse_prev_rotation = atan2(prev_mouse_position[0],prev_mouse_position[1])
		#calculate the original radian of mouse position from center screen
		prev_rot = $".".rotation.y 

	if (Input.is_action_pressed("middle mouse")):
		next_mouse_position = get_viewport().get_mouse_position() - $Camera3D.unproject_position($".".position)
		#finds the mouse updated position using the screen center as 0,0
		mouse_next_rotation = atan2(next_mouse_position[0],next_mouse_position[1])
		#calculate the current radian of mouse position from center screen
		
		rot_difference = angle_difference(mouse_next_rotation,mouse_prev_rotation)
		#find the size of mouse movment
		
		$".".rotation.y = lerp_angle(deg_to_rad($".".rotation.y),prev_rot + rot_difference,1)
		print($".".rotation.y)
		#$".".rotation.y = lerp_angle(deg_to_rad($".".rotation.y),rot,1)
		#rotate the camera controller based on the angle
