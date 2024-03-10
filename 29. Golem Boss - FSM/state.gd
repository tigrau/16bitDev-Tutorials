extends Node2D
class_name GolemBossState

@onready var debug: Label = $"../../Debug"
@onready var player = owner.get_parent().find_child("Player")
@onready var animation_player = $"../../AnimationPlayer"


func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)
	
func _physics_process(_delta: float) -> void:
	transition()
	debug.text = name
	
func transition():
	pass
