extends CharacterBody2D

@onready var tilemap = get_tree().current_scene.find_child("TileMap")

var pos := Vector2.ZERO

var area : String = "":
	set(value):
		area = value
		%Tile.text = value

var step_size : int = 7

var distance_in_pixel : float = 0.0:
	set(value):
		distance_in_pixel = value
		var step = distance_in_pixel / step_size
		%Distance.text = "%d" % step
		
		if step >= Manager.encounter_number:
			set_physics_process(false)
			
			Manager.save_player_data(self)
			Manager.change_scene()

func _ready() -> void:
	position = Manager.player_last_position

func update_tile():
	var tiledata = tilemap.get_cell_tile_data(0,tilemap.local_to_map(position))
	if tiledata:
		area = tiledata.get_custom_data("Area")

func _physics_process(delta: float) -> void:
	var initial_position = position
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 100
	move_and_slide()
	
	distance_in_pixel += position.distance_to(initial_position)
	
	update_tile()

func set_pos():
	position = pos
