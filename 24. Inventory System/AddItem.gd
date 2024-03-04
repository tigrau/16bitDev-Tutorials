extends Button


func _on_pressed() -> void:
	owner.find_child("Inventory").add_slot(str(randi() % 3))
