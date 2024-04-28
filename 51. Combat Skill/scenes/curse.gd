extends Area2D

var is_placed: bool = false:
	set(value):
		is_placed = value
		$CollisionShape2D.disabled = false
		$Polygon2D.modulate = Color(1,1,1,0)

func _physics_process(delta: float) -> void:
	if not is_placed:
		global_position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("place"):
		is_placed = true
		await get_tree().create_timer(0.25).timeout
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.elemental_weakness()
	body.set_status("Cursed")
