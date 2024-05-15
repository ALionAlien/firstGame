extends Node2D

var paused_overlay = load("res://menus/options_overlay.tscn")

func _on_resume_pressed():
		get_tree().paused = false
		queue_free()

func _on_options_pressed():
	add_child(paused_overlay.instantiate())


func _on_return_to_menu_pressed():
	get_tree().paused = false
	queue_free()
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_quit_2_pressed():
	get_tree().paused = false
	queue_free()
	get_tree().quit()
