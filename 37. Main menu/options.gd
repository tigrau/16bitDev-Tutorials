extends Button

@onready var settings: TabContainer = %Settings


func _on_pressed() -> void:
	settings.show()
	get_parent().hide()
