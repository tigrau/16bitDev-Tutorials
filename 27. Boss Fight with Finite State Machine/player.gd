extends CharacterBody2D

@export var bullet_node : PackedScene

func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 111
	move_and_slide()

func take_damage():
	print("im hurt")

func shoot():
	
	var bullet = bullet_node.instantiate()
	
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	
	bullet.set_collision_mask_value(1, false)
	bullet.set_collision_mask_value(2, true)

	get_tree().current_scene.call_deferred("add_child", bullet)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
