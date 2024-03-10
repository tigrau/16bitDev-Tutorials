extends Area2D

@onready var player = get_parent().find_child("Player")

var acceleration : float = 0
var velocity : Vector2 = Vector2.RIGHT * 50

func _physics_process(delta: float) -> void:
	acceleration += 10 * delta
	velocity += acceleration * (player.position - position).normalized()
	rotation = velocity.angle()
	position += velocity * delta
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
