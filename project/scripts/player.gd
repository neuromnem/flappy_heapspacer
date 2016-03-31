extends RigidBody2D

var hit = false
var PLAYER_STATE = "idle"
var animationPlayer
var gameoverMenu

func _ready():
	get_tree().set_pause(true)
	set_fixed_process(true)
	set_process_input(true)

	animationPlayer = get_node("anim")
	gameoverMenu = get_tree().get_root().get_node("base/end_menu")


func _fixed_process(delta):
	var velocity = get_linear_velocity()
	var newVelocity = Vector2(120, velocity.y)

	if PLAYER_STATE == "idle":
		newVelocity.y += delta * 250

	if PLAYER_STATE == "fly":
		newVelocity.y -= delta * 500

	if not hit:
		set_linear_velocity(newVelocity)
		game_state.set_score(floor(get_pos().x / 128))
	else:
		set_fixed_process(false)
		set_process_input(false)
		gameoverMenu.show()


func _input(event):
	if event.is_action_pressed("fly") and PLAYER_STATE == "idle":
		# begins flying
		animationPlayer.play("fly")
		animationPlayer.queue("loop")
		PLAYER_STATE = "fly"

	if event.is_action_released("fly"):
		# end fly
		animationPlayer.clear_queue()
		animationPlayer.play_backwards("fly")
		PLAYER_STATE = "idle"


func _on_player_body_enter( body ):
	if not hit and animationPlayer.is_playing():
		animationPlayer.clear_queue()
		animationPlayer.play_backwards("fly")

	PLAYER_STATE = "idle"
	hit = true
