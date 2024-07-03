extends RigidBody2D

var reset_state = false
var translated_position = Vector2.ZERO

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if reset_state:
		state.transform = Transform2D(0.0, translated_position)
		reset_state = false

func move(pos):
	translated_position = pos
	reset_state = true
