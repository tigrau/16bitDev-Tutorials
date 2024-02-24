extends Button

const SAVE_PATH = "user://entity.init" 
#location of out save file


func _on_pressed() -> void:
	var config = ConfigFile.new()
	
	config.load(SAVE_PATH)
	config.clear()
	config.save(SAVE_PATH)

	get_tree().call_group("entity", "_save")
