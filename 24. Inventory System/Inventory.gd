extends ItemList

func add_slot(ID = "0"):
	var item_texture = load("res://24. Inventory System/assets/" + ItemData.get_texture_name(ID))
	var item_name = ItemData.get_item_name(ID)
	add_item(item_name, item_texture)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		visible = !visible
		if visible == true and item_count > 0:
			grab_focus()
			select(0)
