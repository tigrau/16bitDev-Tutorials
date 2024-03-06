extends Node2D
class_name State

@onready var debug = owner.find_child("Debug")
@onready var player = owner.get_parent().find_child("Player")
@onready var progress_bar = owner.find_child("ProgressBar")
@onready var animated_player = owner.find_child("AnimationPlayer")


func _ready() -> void:
	set_physics_process(false)

func enter():
	set_physics_process(true)
	
func exite():
	set_physics_process(false)

func transition():
	pass

func _physics_process(_delta: float) -> void:
	transition()
	debug.text = name
