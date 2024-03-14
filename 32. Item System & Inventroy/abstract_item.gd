extends Sprite2D

@export var ID ="0"

func _ready():
	scale = Vector2(0.1,0.1)
	texture = load("res://32. Item System & Inventroy/assets/" + Database.get_texture(ID))
	get_rect()

func _on_body_entered(body: Node2D) -> void:
	get_parent().find_child("Inventory").add_item(ID)
	queue_free()
	
