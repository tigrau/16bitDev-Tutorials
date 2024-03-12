extends Area2D

@export var texture_array : Array[Texture2D]

var speed = 100
var direction = Vector2.RIGHT
var bullet_type: int = 0
func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.set_status(bullet_type)

func set_property(type):
	bullet_type = type
	$Sprite2D.texture = texture_array[type]
