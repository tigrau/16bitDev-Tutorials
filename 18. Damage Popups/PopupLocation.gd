extends Marker2D

@export var damage_node : PackedScene

func _ready() -> void:
	randomize()

func popup():
	var damage_popup = damage_node.instantiate()
	damage_popup.position = global_position
	
	var tween = get_tree().create_tween()
	tween.tween_property(damage_popup,
						"position",
						global_position + _get_direction(),
						0.75)

	get_tree().current_scene.add_child(damage_popup)

func _get_direction():
	return Vector2(randf_range(-1,1), -randf()) * 16
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		popup()
		
