extends Area2D

var direction := Vector2.RIGHT
func _process(delta: float) -> void:
	position += direction * 300 * delta

func _on_body_entered(body: Node2D) -> void:
	body.take_damage()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
