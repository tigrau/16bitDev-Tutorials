extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var sprite = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar

var direction : Vector2

var health = 30:
	set(value):
		health = value
		progress_bar.value = value
		if health <= 0:
			find_child("FiniteStateMachine").change_state("DeathSkeleton")

func _process(_delta: float) -> void:
	direction = player.position - position
	
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)

func take_damage():
	health -= 10
