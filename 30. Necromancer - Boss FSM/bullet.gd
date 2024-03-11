extends Area2D

var direction  = Vector2.RIGHT
var speed = 300

func _physics_process(delta: float) -> void:
	position += speed * direction * delta


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	queue_free()


func _on_screen_exited() -> void:
	queue_free()
