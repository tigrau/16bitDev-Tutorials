extends Sprite2D

@export var item : Item36

func _ready() -> void:
	texture = item.icon


func _on_player_entered(body: Node2D) -> void:
	body.add_item(item)
	queue_free()
