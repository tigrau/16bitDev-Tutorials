extends CharacterBody2D

@export var bullet_node : PackedScene
@onready var player = get_parent().find_child("Player")

func shoot() -> void :

	var bullet = bullet_node.instantiate()
	
	bullet.position = global_position
	bullet.direction = (player.global_position - global_position).normalized()
	
	get_tree().current_scene.call_deferred("add_child", bullet)
	


func _on_timer_timeout() -> void:
	shoot()

func take_damage():
	queue_free()
	pass

func scatter(pos):
	var tween_position = get_tree().create_tween()
	tween_position.tween_property(self,"global_position", pos, 0.7)
	await tween_position.finished
	$Timer.start()
