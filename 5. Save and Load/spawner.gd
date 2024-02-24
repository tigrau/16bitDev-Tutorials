extends Node2D

@export var object : PackedScene
@export var object_speed : float


func _on_respawn_time_timeout() -> void:
	var obj = object.instantiate()
	
	obj.speed = object_speed
	obj.position = global_position

	get_tree().current_scene.add_child(obj)
