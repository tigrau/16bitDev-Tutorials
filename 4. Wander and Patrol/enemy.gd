extends CharacterBody2D

@export var wander_direction : Node2D 

func _physics_process(delta: float) -> void:
	velocity = wander_direction.direction * 200
	move_and_slide()
