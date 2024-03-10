extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var animation = $AnimatedSprite2D

func _ready() -> void:
	set_physics_process(false)
	await animation.animation_finished
	set_physics_process(true)
	animation.play("idle")

func _physics_process(delta: float) -> void:
	var direction = player.position - position
	velocity = direction.normalized() * 60
	move_and_slide()

func take_damage():
	queue_free()
