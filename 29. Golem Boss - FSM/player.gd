extends CharacterBody2D

@export var bullet_node : PackedScene

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = position
	bullet.direction = (get_global_mouse_position() - position).normalized()
	owner.call_deferred("add_child", bullet)
