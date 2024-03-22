extends Button

@export var lvl : String = "1"

signal level(lvl)

func _on_pressed() -> void:
	level.emit(lvl)
	disabled = true
