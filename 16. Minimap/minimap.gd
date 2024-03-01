extends SubViewport

@onready var camera: Camera2D = $Camera2D

func _physics_process(delta: float) -> void:
	camera.position = owner.find_child("Player").position
