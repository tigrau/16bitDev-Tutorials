extends Area2D

@onready var label: Label = $Label

var speed = 200
var direction = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += direction * speed * delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
