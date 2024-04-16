extends Button

var quest : Quest:
	set(value):
		quest = value
		text = value.title + " [QUEST]"


func _on_pressed() -> void:
	QuestManager.quest = quest
	queue_free()
