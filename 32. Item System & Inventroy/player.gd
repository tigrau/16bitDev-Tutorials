extends CharacterBody2D

@onready var speed: Timer = $Speed
var can_shoot : bool =false
var ATK =0


@export var bullet_node : PackedScene
#@onready var calc_atk  = get_parent().find_child("UI").find_child("Character").atk.text
#$"../UI/Character"
func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and can_shoot:
		shoot()
		speed.start()
	elif event.is_action_released("shoot"):
		speed.stop()
		
func shoot():
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	get_tree().current_scene.add_child(bullet)
	bullet.label.text = get_parent().find_child("UI").find_child("Character").atk.text

func set_speed(base_ATK):
	if base_ATK != 0:
		can_shoot = true
		speed.wait_time = 0.125 * base_ATK
		
		
func _on_speed_timeout() -> void:
	shoot()
