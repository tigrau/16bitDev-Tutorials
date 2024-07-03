extends PanelContainer

@export var item: Item57 = null:
	set(value):
		item = value
		if value != null:
			$TextureRect.texture = value.texture

func _on_mouse_entered() -> void:
	if item == null:
		return
	Popups.ItemPopup(Rect2i( Vector2i(global_position) , Vector2i(size) ), item)


func _on_mouse_exited() -> void:
	Popups.HideItemPopup()
