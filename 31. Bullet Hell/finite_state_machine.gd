extends Node2D

var current_state: BulletHellState
var previous_state: BulletHellState

func _ready() -> void:
	current_state = get_child(0) as BulletHellState
	previous_state = current_state
	current_state.enter()

func change_state(state):
	if state == previous_state.name:
		return
	
	current_state = find_child(state) as BulletHellState
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
