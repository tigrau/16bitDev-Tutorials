extends Node2D
class_name PathFinding

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var target: CharacterBody2D = owner.get_parent().find_child("Player")
var direction = Vector2.ZERO

func _ready() -> void:
	update_target()

func update_target():
	navigation_agent_2d.target_position = target.position


func _on_timer_timeout() -> void:
	update_target()
	direction = to_local(navigation_agent_2d.get_next_path_position()).normalized()
