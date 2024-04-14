extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var reset: Timer = $Reset

var speed: float = 75.0

func _physics_process(delta: float) -> void:
	if position.y < 40:
		speed = abs(speed)
	elif position.y > 120:
		speed = - abs(speed)
	velocity = speed * Vector2.DOWN
	move_and_slide()

func slow_down(multiplier = 0.3, time = 3):
	reset.wait_time = time
	speed *= multiplier
	reset.start

func damage():
	sprite.play("hit")
	await sprite.animation_finished
	sprite.play("idle")

func damage_tick(count = 3):
	for i in range(count):
		damage()
		await get_tree().create_timer(1).timeout

func _on_reset_timeout() -> void:
	speed = 75
	
