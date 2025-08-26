extends CharacterBody2D

@export var SPEED = 300.0

@onready var ANIMATION_TREE : AnimationTree = $Animation/AnimationTree
@onready var SPRITE : Sprite2D = $Animation/Sprite2D
@onready var STATE_MACHINE : StateMachine = $StateMachine
@onready var RAYCASTS = $Raycasts

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	if direction and STATE_MACHINE.check_if_can_move():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	update_animation()
	move_and_slide()

func update_animation():
	if velocity.x > 0:
		SPRITE.flip_h = false
		ANIMATION_TREE.set("parameters/Move/blend_position", 1)
	if velocity.x < 0:
		SPRITE.flip_h = true
		ANIMATION_TREE.set("parameters/Move/blend_position", -1)
	elif velocity.x == 0: 
		ANIMATION_TREE.set("parameters/Move/blend_position", 0)

func get_next_to_wall():
	for raycast in RAYCASTS.get_children():
		raycast.force_raycast_update()
		if raycast.is_colliding():
			if raycast.target_position.x > 0:
				return Vector2.RIGHT
			else: 
				return Vector2.LEFT
	return null
