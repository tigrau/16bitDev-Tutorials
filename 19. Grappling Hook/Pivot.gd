extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		look_at(get_global_mouse_position())
