extends Node2D
@onready var debug: Label = $"../Debug"

var current_state
var previos_state

func _ready() -> void:
	current_state = get_child(0)
	previos_state = current_state
	current_state.enter()

func change_state(state):
	current_state = find_child(state)
	current_state.enter()
	
	previos_state.exit()
	previos_state = current_state
