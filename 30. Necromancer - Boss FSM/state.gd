extends Node2D
class_name NecromancerState

@onready var player = owner.get_parent().find_child("Player")
@onready var animation_player = owner.find_child("AnimationPlayer")
@onready var debug = owner.find_child("Debug")

func _ready() -> void:
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)

func transition():
	pass

func _physics_process(_delta: float) -> void:
	transition()
	debug.text = name

