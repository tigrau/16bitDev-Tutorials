extends Area2D

var direction : Vector2 = Vector2.RIGHT
const SPEED := 600

func _process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()


func _on_screen_exited() -> void:
	queue_free()
