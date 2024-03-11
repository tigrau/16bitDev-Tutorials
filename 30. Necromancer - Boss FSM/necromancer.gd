extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var sprite = $Sprite2D
@onready var progress_bar: ProgressBar = %ProgressBar2

var direction : Vector2

var health = 100:
	set(value):
		if value < health:
			find_child("FiniteStateMachine").change_state("Stagger")
		health = value
		progress_bar.value = value
		
		if value <= 0:
			find_child("FiniteStateMachine").change_state("Death")

func _process(delta: float) -> void:
	direction = player.position - position
	
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func take_damage():
	if health > 0:
		health -= 10
