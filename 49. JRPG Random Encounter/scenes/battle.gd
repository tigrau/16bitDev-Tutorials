extends Node2D

@onready var bg: Sprite2D = $BG
@export_dir var BG_FOLDER

var enemy : Enemy49 = null:
	set(value):
		enemy = value
		if value != null:
			%Enemy.texture = value.texture

func _ready():
	load_data()
	
func load_data():
	bg.texture = load(BG_FOLDER + "/" + Manager.area + ".jpg")
	enemy = Manager.get_enemy()
