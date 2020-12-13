extends Actor

func _on_StompDetector_area_entered(area):
	queue_free()

func _ready():
	_velocity.x = -speed.x

func _physics_process(delta):
	_velocity.y += gravity * delta
	
	if is_on_wall():
		_velocity.x *= -1.0
		$"enemy-idle".scale.x *= -1.0
	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y



