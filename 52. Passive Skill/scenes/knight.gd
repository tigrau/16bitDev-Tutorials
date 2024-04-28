extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var progress_bar: ProgressBar = $ProgressBar

var regen_amount: float = 0

func _ready():
	regen_amount = 5

func _physics_process(delta: float) -> void:
	regen(delta)
	
	animation()
	set_direction()
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 100
	move_and_slide()

func _input(event):
	if event.is_action_pressed("attack"):
		play_skill("attack")

func animation():
	if velocity.length() == 0:
		animation_player.play("idle")
	else:
		animation_player.play("run")

func set_direction():
	if velocity.x > 0:
		%Hitbox.scale.x = 1
		sprite.flip_h = false
	elif velocity.x < 0:
		%Hitbox.scale.x = -1
		sprite.flip_h = true

func play_skill(animation_name):
	animation_player.play(animation_name)
	set_physics_process(false)
	
	await animation_player.animation_finished
	
	animation_player.play("idle")
	set_physics_process(true)

func regen(delta):
	progress_bar.value += delta * regen_amount

func take_damage(amount, source):
	progress_bar.value -= amount
