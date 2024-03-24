extends Area2D
class_name Placeable

var is_placed: bool = false:
	set(value):
		is_placed = value
		
		$CollisionShape2D.disabled = false
		$Timer.start()
		$Sprite2D.modulate = Color(1, 1, 1)
		$Preview.modulate = Color(1, 1, 1, 0)
		
		set_process_input(false)

func _input(event) -> void:
	if event.is_action_pressed("shoot"):
		is_placed = true

func _physics_process(delta: float) -> void:
	if not is_placed:
		global_position = get_global_mouse_position()


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
