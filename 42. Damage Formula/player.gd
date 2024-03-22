extends CharacterBody2D

@export var bullet_node : PackedScene
@onready var enemy = get_tree().current_scene.find_child("Enemy")

var damage_type: int =1:
	set(value):
		damage_type = value
		$DamageType.text = ["Physical","Fire","Electric"][(value - 1)]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
		
	if event is InputEventKey:
		if event.keycode == KEY_1:
			damage_type = 1
		if event.keycode == KEY_2:
			damage_type = 2
		if event.keycode == KEY_3:
			damage_type = 3

func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.damage_type = damage_type
	get_tree().current_scene.add_child(bullet)
