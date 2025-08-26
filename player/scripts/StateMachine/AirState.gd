class_name AirState extends State

@export var LANDING_STATE : State
@export var WALL_STATE : State
@export var DOUBLE_JUMP_VELOCITY : float = -150
@export var air_Jump_animation : String = "jump_air"
@export var landing_animation_name : String = "jump_end"

var has_double_jumped : bool = false

func state_process(delta):
	if character.is_on_floor():
		next_state = LANDING_STATE
	if character.get_next_to_wall() == Vector2.LEFT or character.get_next_to_wall() == Vector2.RIGHT:
		next_state = WALL_STATE
	
func on_exit():
	if next_state == LANDING_STATE:
		playback.travel(landing_animation_name)
		has_double_jumped = false

func state_input(event : InputEvent):
	if event.is_action_pressed("jump") and !has_double_jumped:
		air_jump()

func air_jump():
	character.velocity.y = DOUBLE_JUMP_VELOCITY
	playback.travel(air_Jump_animation)
	has_double_jumped = true
