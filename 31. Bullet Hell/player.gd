extends CharacterBody2D

var speed = 250
@onready var debug = $Debug
@onready var progress_bar: ProgressBar = $ProgressBar

var health = 100:
	set(value):
		health = value
		progress_bar.value = value
func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	move_and_slide()

func set_status(bullet_type):
	match bullet_type:
		0:
			fire()
		1:
			poison()
		2:
			slow()
		3: 
			stun()

func take_damage():
	pass

func fire():
	debug.text = "fire"
	health -= 10

func poison():
	debug.text = "poison"
	for i in range(5):
		health -= 2
		await get_tree().create_timer(1).timeout

func slow():
	debug.text = "slow"
	speed = 50

func stun():
	debug.text = "stun"
	speed = 0
	await get_tree().create_timer(2.5).timeout
	speed = 250
