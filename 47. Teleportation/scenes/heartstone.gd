extends TextureButton

@export var player: CharacterBody2D
@export var bed: Sprite2D

func _on_pressed() -> void:
	player.casting(3)
	await player.find_child("Cast").timeout
	player.position = bed.position
