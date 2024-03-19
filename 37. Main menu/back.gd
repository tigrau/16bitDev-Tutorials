extends Button
@onready var main_menu: VBoxContainer = $"../../../MainMenu"
@onready var settings: TabContainer = %Settings


func _on_pressed() -> void:
	main_menu.show()
	settings.hide()
