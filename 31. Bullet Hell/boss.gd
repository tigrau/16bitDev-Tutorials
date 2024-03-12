extends CharacterBody2D

@export var bullet_node : PackedScene
var bullet_type: int = 0
#store angles in radians
@export_range(0, 2*PI) var alpha: float = 0.0
var theta : float = 0.0


func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func shoot(angle):
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = get_vector(angle)
	bullet.set_property(bullet_type)

	get_tree().current_scene.call_deferred("add_child",bullet)
	

func _on_speed_timeout() -> void:
	shoot(theta)
