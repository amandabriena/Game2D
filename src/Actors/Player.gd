extends Actor

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("move_up") and _velocity.y < 0
	var direction = get_director()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_director() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_up") and is_on_floor() else 1.0
	)

func calculate_move_velocity(
	linear_velocit: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
):

	var out: = linear_velocit
	
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	
	if is_jump_interrupted:
		out.y = 0.0

	
	return out