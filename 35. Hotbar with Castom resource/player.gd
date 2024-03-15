extends CharacterBody2D

@onready var fx: AnimatedSprite2D = $FX
@onready var hot_bar: HBoxContainer = $UI/HotBar

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
	move_and_slide()

func play_FX(skill):
	fx.play(skill.name)

func add_item(stats, skill):
	hot_bar.add_item(stats, skill)

func has_empty_slot():
	return find_child("Weapons").is_available()
