extends Area2D

var source
var damage : float = 40
var speed : float = 150

func _physics_process(delta: float) -> void:
	position.x -= delta * speed


func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage, source)


func _on_screen_exited() -> void:
	queue_free()
