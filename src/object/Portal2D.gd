tool
extends Area2D

onready var animation: AnimationPlayer = get_node("AnimationPlayer")

export var next_scene: PackedScene

func _get_configuration_warning():
	return "A propriedade next_scene não pode ser vazia" if not next_scene else ""
	
func _on_Portal2D_body_entered(body):
	teleport()

func teleport() -> void:
	animation.play("fade in")
	yield(animation, "animation_finished")
	get_tree().change_scene_to(next_scene)
