class_name State extends Node

@export var can_move : bool = true

var character : CharacterBody2D
var next_state : State
var playback : AnimationNodeStateMachinePlayback

func state_process(delta):
	pass

func state_input(event : InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass
