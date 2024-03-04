extends Sprite2D

var id = ""

#testing
#func _ready():
	#set_property()

func set_property(ID = "0"):
	id = ID
	texture = load("res://24. Inventory System/assets/" + ItemData.get_texture_name(ID))

func _on_body_entered(body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", body.position, 0.1)
	
	await tween.finished
	get_parent().find_child("Inventory").add_slot(id)
	queue_free()
