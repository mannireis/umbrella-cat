class_name WallState extends State

@export var AIR_STATE : State
@export var GROUND_STATE : State
@export var JUMP_VELOCITY = -200
@export var jump_animation : String = "jump_start"

func state_process(delta):
	if character.is_on_floor():
		next_state = GROUND_STATE

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()

func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = AIR_STATE
	playback.travel(jump_animation)

func climb():
	pass
