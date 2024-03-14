extends Sprite2D
class_name AbstractItem34

@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D
@onready var player = get_tree().current_scene.find_child("Player")

var stats: Item34 = null:
	set(value):
		stats = value
		
		if value != null:
			texture = value.icon
			stats.connect("item_used",use_item)

func _ready() -> void:
	#testing
	stats = ItemDatabase34.get_item("throwing_axes")

func use_item():
	print("Item Used")


func _on_player_entered(body: Node2D) -> void:
	if body is Player34:
		body.add_item(stats)
		call_deferred("reparent", body)
