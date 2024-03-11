extends Area2D

var player
var direction
var speed = 250

func _ready() -> void:
	player = get_parent().find_child("Player")
	direction = (player.position - position).normalized()

func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_screen_exited() -> void:
	queue_free()
