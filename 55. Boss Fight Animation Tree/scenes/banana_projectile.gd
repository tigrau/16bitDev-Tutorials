extends Area2D

var direction: Vector2 = Vector2.ZERO

func _ready():
	direction = (get_global_mouse_position() - position).normalized()

func _physics_process(delta: float) -> void:
	position += direction * 150 * delta
	$Sprite2D.rotation += delta * 15

func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage(35)
