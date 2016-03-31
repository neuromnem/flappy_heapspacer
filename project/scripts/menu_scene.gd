extends Node2D

var game_state
var start_menu
var end_menu

func _ready():
	game_state = get_node("/root/game_state")
	start_menu = get_node("start_menu")
	end_menu = get_node("end_menu")

	if game_state.is_restart():
		start_menu.hide()
		get_tree().set_pause(false)


func _on_start_button_pressed():
	game_state.set_restart(true)
	start_menu.hide()
	get_tree().set_pause(false)


func _on_restart_button_pressed():
	end_menu.hide()
	game_state.set_score(0)
	get_tree().change_scene("res://scenes/menu_scene.tscn")
