extends AbstractItem34


var direction : Vector2 = Vector2.RIGHT
var is_throwing : bool = false

func _ready() -> void:
	set_physics_process(false)
	stats = ItemDatabase34.get_item("throwing_axes")

func _physics_process(delta: float) -> void:
	check_direction()
	position += direction * 700 * delta

func use_item():
	set_physics_process(true)

	collision.disabled = is_throwing
	call_deferred("reparent",get_tree().current_scene)

	if is_throwing:
		$Timer.start()
	else:
		$Timer.stop()

	is_throwing = !is_throwing


func _on_timer_timeout() -> void:
	set_physics_process(false)

func check_direction():
	var direction_to_mouse = get_global_mouse_position() - global_position
	var direction_to_player = player.global_position - global_position

	if is_throwing and direction_to_player.length() > 5:
		direction = direction_to_player.normalized()
	
	elif !is_throwing and direction_to_mouse.length() > 5:
		direction = direction_to_mouse.normalized()
		
	else:
		set_physics_process(false)
