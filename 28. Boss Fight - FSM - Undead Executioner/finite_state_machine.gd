extends Node2D

var current_state: StateSkeletonBoss
var previous_state: StateSkeletonBoss

func _ready() -> void:
	current_state = get_child(0) as StateSkeletonBoss
	previous_state = current_state
	current_state.enter()

func change_state(state):
	current_state = find_child(state) as StateSkeletonBoss
	current_state.enter()
	
	previous_state.exit()
	previous_state = current_state
	
	
