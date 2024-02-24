extends CharacterBody2D

var speed : float = 20

const SAVE_PATH = "user://entity.ini"

func _physics_process(delta: float) -> void:
	velocity = Vector2.RIGHT * speed
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _save():
	var config := ConfigFile.new()
	
	config.load(SAVE_PATH)

	config.set_value(name, "position", global_position)
	config.set_value(name, "speed", speed)
	config.set_value(name, "file_path", self.scene_file_path)

	config.save(SAVE_PATH)

func _load(section):
	var config := ConfigFile.new()
	
	config.load(SAVE_PATH)
	
	position = config.get_value(section, "position")
	speed = config.get_value(section, "speed")
