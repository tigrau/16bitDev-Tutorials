extends TextureButton

@export var animation_name : String


func _on_pressed() -> void:
	owner.play_skill(animation_name)
