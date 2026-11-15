extends CharacterBody3D

@export var gravity = 20
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 7

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var inputVector := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var movement := Vector3(inputVector.x, 0, inputVector.y)
	if movement:
		velocity.x = movement.x * SPEED
		velocity.z = movement.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
