extends Button
class_name Slot35
@onready var player = get_tree().current_scene.find_child("Player")

@export var stats : Item35 = null:
	set(value):
		stats = value
		
		if value != null:
			icon = value.icon
		else:
			icon = null

@export var skill : Skill35 = null

func _ready() -> void:
	set_process_input(false)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		use_item()

func use_item():
	if stats == null:
		return
	player.play_FX(skill)


func _on_pressed() -> void:
	use_item()
	get_parent().current_index = get_index()
	player.find_child("Weapons")._on_hot_bar_index(get_index())
