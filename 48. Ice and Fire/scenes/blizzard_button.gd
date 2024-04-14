extends TextureButton

@export var skill_node : PackedScene


func _on_pressed() -> void:
	var skill = skill_node.instantiate()
	skill.position = get_global_mouse_position()
	get_tree().current_scene.call_deferred("add_child", skill)
	#get_tree().current_scene.add_child(skill)
	#get_tree().current_scene.add_child(skill.instantiate())
