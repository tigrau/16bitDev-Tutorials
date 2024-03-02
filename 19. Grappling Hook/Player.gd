extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 150
	move_and_slide()


func _on_hook_hooked(hooked_position: Variant) -> void:
	await get_tree().create_timer(0.2).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(self,"position",hooked_position, 0.75)
