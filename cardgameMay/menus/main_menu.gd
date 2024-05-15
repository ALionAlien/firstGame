extends Node2D

var paused_overlay = load("res://menus/options_overlay.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_options_pressed():
	add_child(paused_overlay.instantiate())

func _on_exit_pressed():
	get_tree().quit()
