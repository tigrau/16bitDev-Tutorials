extends CharacterBody2D

@onready var tilemap = get_tree().current_scene.find_child("TileMap")

var is_jumping : bool = false:
	set(value):
		is_jumping = value
		if value == true:
			%State.text = "air"
		else:
			%State.text = "land"

var floor : int = 0:
	set(value):
		floor = value
		%Floor.text = str(value)

var height : int = 0:
	set(value):
		height = value
		z_index = value
		%Height.text = str(value)

var z_pos: float = 0:
	set(value):
		z_pos = value
		%Zpos.text = str("%.2f" % value)

func update_tile():
	var tiledata = tilemap.get_cell_tile_data(0,tilemap.local_to_map(position))
	if tiledata:
		floor = tiledata.get_custom_data("height")

func on_land():
	if not is_jumping:
		velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
		
		if floor < height:
			height = floor
		
func jump():
	if Input.is_action_just_pressed("jump"):
		if is_jumping == false:
			height += 1
			velocity.y -= 200
		is_jumping = true

func in_air():
	if is_jumping:
		velocity.y += 9.8
		if velocity.y >= 180:
			is_jumping = false
			height -= 1
		velocity.x = Input.get_axis("ui_left", "ui_right") * 100
		
		if floor == height:
			is_jumping = false
			velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	update_tile()
	
	z_pos = position.y
	
	on_land()
	jump()
	in_air()
	
	move_and_slide()
