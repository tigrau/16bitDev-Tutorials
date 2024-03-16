extends PanelContainer
class_name Slot36

@onready var texture_rect: TextureRect = $TextureRect

@export var item : Item36 = null :
	set(value):
		item = value
		
		if value != null:
			$TextureRect.texture = value.icon
		else:
			$TextureRect.texture = null

func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture_rect.texture
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	return preview

func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(get_preview())
	return self

func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Slot36

func _drop_data(_pos: Vector2, data: Variant) -> void:
	var temp = item
	item = data.item
	data.item = temp
