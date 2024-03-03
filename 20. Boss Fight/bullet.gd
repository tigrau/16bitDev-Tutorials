extends Area2D

var direction = Vector2.RIGHT
var speed = 600

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_screen_exited() -> void:
	queue_free()
