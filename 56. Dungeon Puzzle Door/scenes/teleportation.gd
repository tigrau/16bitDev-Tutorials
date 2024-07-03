extends Node2D


func _on_enter_body_entered(body: Node2D) -> void:
	
	if body is RigidBody2D:
		body.move(%Exit.position + Vector2(0,-100))
		return
	
	body.position = %Exit.position + Vector2(0,-100)


func _on_exit_body_entered(body: Node2D) -> void:
	body.position = %Enter.position + Vector2(0,-100)
	if body is RigidBody2D:
		body.move(%Enter.position + Vector2(0,-100))
		return
