extends CharacterBody2D

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var player = get_parent().find_child("Player")
@onready var progress_bar: ProgressBar = $ProgressBar

var health: = 2:
	set(value):
		health = value
		progress_bar.value = value

var direction = Vector2.RIGHT
var speed = 40.0

func _ready() -> void:
	set_physics_process(false)

func _process(delta: float) -> void:
	direction = (player.position - global_position).normalized()
	ray_cast.target_position = direction * 100

func _physics_process(delta: float) -> void:
	velocity = direction * speed 
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		health -= 1
