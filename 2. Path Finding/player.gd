extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 1000
	move_and_slide()
