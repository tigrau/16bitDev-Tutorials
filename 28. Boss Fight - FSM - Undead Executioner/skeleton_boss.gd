extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var progress_bar: ProgressBar = $CanvasLayer/ProgressBar

var direction : Vector2

var health : int = 10 :
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")

func _ready() -> void:
	set_physics_process(false)

func _process(_delta: float) -> void:
	direction = player.position - position
	
	if direction.x < 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * 60
	move_and_collide(velocity * delta)


func take_damage():
	health -= 2
