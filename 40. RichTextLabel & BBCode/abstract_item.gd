extends Sprite2D

@export var item : Item40

func _ready() -> void:
	texture = item.icon
	

func _on_player_entered(body: Node2D) -> void:
	get_tree().current_scene.find_child("ItemMessage").send_message(item)
	queue_free()
