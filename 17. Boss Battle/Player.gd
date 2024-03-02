extends CharacterBody2D
@onready var progress_bar: ProgressBar = $ProgressBar

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 200
	move_and_slide()

func take_damage():
	progress_bar.value -= 1
