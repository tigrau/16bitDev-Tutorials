extends Button

const SAVE_PATH = "user://entity.ini"

func _on_pressed() -> void:
	var config = ConfigFile.new()
	
	config.load(SAVE_PATH)
	
	get_tree().call_group("entity", "queue_free")

	var sections = config.get_sections()
	
	for section in sections:
		var entity = load(config.get_value(section, "file_path"))
		var entity_obj = entity.instantiate()
		
		entity_obj._load(section)
		
		get_tree().current_scene.add_child(entity_obj)
