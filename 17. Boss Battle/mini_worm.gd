extends CharacterBody2D


func _on_hit_box_body_entered(body: Node2D) -> void:
	body.take_damage()
