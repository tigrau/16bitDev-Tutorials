extends Node2D

var current_state : NecromancerState
var previous_state : NecromancerState

func _ready() -> void:
	current_state = get_child(0) as NecromancerState
	previous_state = current_state
	current_state.enter()

func change_state(state):
	if state == previous_state.name: 
		return

	current_state = find_child(state) as NecromancerState
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
