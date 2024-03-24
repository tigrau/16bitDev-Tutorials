extends Sprite2D

@onready var tilemap = get_tree().current_scene.find_child("TileMap")

var can_be_placed: bool = true:
	set(value):
		can_be_placed = value
		if value:
			modulate = Color(1,1,1,0.7)
		else:
			modulate = Color(1,0.25,0.25,0.7)


func update_tile():
	var tiledata = tilemap.get_cell_tile_data(0,tilemap.local_to_map(position))
	if tiledata:
		can_be_placed = tiledata.get_custom_data("placeable")

func _physics_process(delta: float) -> void:
	update_tile()
	position = get_global_mouse_position()

func _input(event):
	if event.is_action_pressed("shoot") and can_be_placed:
		var player = get_tree().current_scene.find_child("Player")
		player.play_VFX()
		await get_tree().create_timer(0.1).timeout
		player.position = position
		queue_free()
