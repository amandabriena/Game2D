extends Actor


onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_StompDetector_area_entered(area):
	$StompDetector.queue_free()
	$CollisionShape2D.queue_free()
	
	anim_player.play("die")

func _ready():
	_velocity.x = -speed.x

func _physics_process(delta):
	_velocity.y += gravity * delta
	
	if is_on_wall():
		_velocity.x *= -1.0
		$"enemy-idle".scale.x *= -1.0
	
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y



