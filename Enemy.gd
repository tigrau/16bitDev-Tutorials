extends CharacterBody2D

@export var path : PathFinding

func _physics_process(delta: float) -> void:
	velocity = path.direction * 200
	move_and_slide()
