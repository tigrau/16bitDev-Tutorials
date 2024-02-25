extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
var swing : bool = false

@onready var animation_tree: AnimationTree = $AnimationTree

func _physics_process(delta: float) -> void:
	if not swing:
		velocity = direction * 75
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func _process(delta: float) -> void:
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO and not swing:
		set_walking(true)
		update_blend_position()
	else:
		set_walking(false)
		
	if Input.is_action_just_pressed("swing"):
		set_swing(true)

func set_swing(value = false):

	swing = value
	animation_tree["parameters/conditions/swing"] = value
	

func set_walking(value: bool = false):
	animation_tree["parameters/conditions/is_walking"] = value
	animation_tree["parameters/conditions/idle"] = not value
	
func update_blend_position():
	animation_tree["parameters/attack/blend_position"] = direction
	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction
