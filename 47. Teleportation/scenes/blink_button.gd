extends TextureButton

@export var skill_node : PackedScene

func _on_pressed() -> void:
	var skill = skill_node.instantiate()
	skill.global_position = get_global_mouse_position()
	get_tree().current_scene.call_deferred("add_child",skill)
