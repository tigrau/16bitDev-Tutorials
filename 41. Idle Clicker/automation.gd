extends Button

@onready var timer: Timer = %Timer


func _on_pressed() -> void:
	timer.start()
	disabled = true
