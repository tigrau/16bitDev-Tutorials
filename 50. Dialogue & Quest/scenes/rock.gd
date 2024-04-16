extends Sprite2D



func _on_body_entered(body: Node2D) -> void:
	if QuestManager.quest != null:
		QuestManager.next_quest()
		queue_free()
