extends BulletHellState

@onready var collision: CollisionShape2D = %CollisionShape2D

var player_entered : bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)


func _on_body_entered(body: Node2D) -> void:
	player_entered = true

func transition():
	if player_entered:
		get_parent().change_state("5Leaf")
