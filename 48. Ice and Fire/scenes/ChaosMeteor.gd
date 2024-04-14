extends TextureButton

@export var skill_node : PackedScene

func _on_pressed() -> void:
	var skill = skill_node.instantiate()
	skill.position = get_tree().current_scene.find_child("Player").position
	get_tree().current_scene.call_deferred("add_child", skill)
