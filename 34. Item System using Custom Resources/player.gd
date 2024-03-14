extends CharacterBody2D
class_name Player34

@onready var action_bar: HBoxContainer = %ActionBar

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 150
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		use_item()

func add_item(ID):
	action_bar.add_item(ID)

func use_item():
	action_bar.use_item()
