extends HSlider
@onready var world_environment: WorldEnvironment = $"../../WorldEnvironment"


func _on_value_changed(value: float) -> void:
	world_environment.environment.adjustment_brightness = value
