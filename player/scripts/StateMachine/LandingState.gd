class_name LandingState extends State

@export var GROUND_STATE : State
@export var landing_animation_name : String = "jump_end"

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if(anim_name == landing_animation_name):
		next_state = GROUND_STATE
