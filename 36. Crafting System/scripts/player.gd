extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
	move_and_slide()


func add_item(item):
	var inventory = get_tree().current_scene.find_child("Inventory")
	inventory.add_item(item)
