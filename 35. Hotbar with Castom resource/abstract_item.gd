extends Sprite2D

@onready var collision: CollisionShape2D = $Area2D/CollisionShape2D

@export var stats : Item35
@export var skill : Skill35

func _ready():
	if stats != null:
		texture = stats.icon


func _on_player_entered(body: Node2D) -> void:
	if body.has_empty_slot():
		call_deferred("reparent",body.find_child("Weapons"))
		position = body.position
		body.add_item(stats,skill)
		collision.call_deferred("set_disabled",true)
