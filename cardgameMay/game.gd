extends Node3D

var paused_overlay = load("res://menus/pause_overlay.tscn")

func _ready():
	pass # Replace with function body.
#
func _process(delta):
	
	$CameraController.position = $CharacterController.position

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		add_child(paused_overlay.instantiate())
		get_tree().paused = true
		
