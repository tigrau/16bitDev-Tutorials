extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var progress_bar: ProgressBar = $UI/ProgressBar
@onready var sprite: Sprite2D = $Sprite2D

var direction : Vector2
var def = 0
var health :int = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")
		elif value <= progress_bar.max_value / 2 and def == 0:
			def = 5
			find_child("FiniteStateMachine").change_state("ArmorBuff")
		
func _ready() -> void:
	set_physics_process(false)

func _process(delta: float) -> void:
	direction = player.position - position
	if direction.x >= 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
		
func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * 50
	print(velocity)
	#move_and_slide()
	move_and_collide(velocity * delta)
		
func take_damage():
	health -= 10 - def
