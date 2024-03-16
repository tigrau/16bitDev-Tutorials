extends VBoxContainer


func _on_inventory_item_changed() -> void:
	for recipe in get_children():
		print("chekau")
		recipe.check()
