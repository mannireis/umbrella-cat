class_name GroundState extends State

@onready var roll_timer = $Timer

@export var JUMP_VELOCITY = -200
@export var AIR_STATE : State
@export var jump_animation : String = "jump_start"
@export var roll_animation : String = "roll_start"
@export var roll_end_animation : String = "roll_end"
@export var roll_timer_time = 1

func state_process(delta):
	if(!character.is_on_floor()):
		next_state = AIR_STATE

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("roll")):
		roll()

func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = AIR_STATE
	playback.travel(jump_animation)

func roll():
	roll_timer.start(roll_timer_time)
	character.SPEED = 500
	playback.travel(roll_animation)

func _on_timer_timeout() -> void:
	character.SPEED = 300.0
	playback.travel(roll_end_animation)
