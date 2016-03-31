extends Node

var score = 0
var restart = false

func set_score(value):
	score = value
	get_tree().get_root().get_node("base/hud/score").set_text(str(score))


func get_score():
	return score


func set_restart(value):
	restart = value


func is_restart():
	return restart
