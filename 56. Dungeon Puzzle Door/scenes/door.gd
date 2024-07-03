extends Sprite2D

func open_door():
	toggle_door(false)

func close_door():
	toggle_door(true)

func toggle_door(value):
	%DoorCollision.set_deferred("disabled", not value)
	visible = value

func _on_body_entered(body: Node2D) -> void:
	close_door()
