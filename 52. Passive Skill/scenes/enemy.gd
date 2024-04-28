extends CharacterBody2D

@onready var progress_bar: ProgressBar = $ProgressBar
@export var bullet_node : PackedScene

func take_damage(amount):
	progress_bar.value -= amount
	
	if progress_bar.value <= 0:
		queue_free()

func _on_timer_timeout() -> void:
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	
	bullet.source = self
	
	get_tree().current_scene.add_child(bullet)
