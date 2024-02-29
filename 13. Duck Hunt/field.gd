extends Node2D

@onready var bullets_node: Label = $CanvasLayer/Bullets
@onready var rounds_node: Label = $CanvasLayer/Rounds
@onready var score_node: Label = $CanvasLayer/Score

var bullets_count = 3:
	set(value):
		if value>=0:
			bullets_count = value
			bullets_node.text = str(value)
		else:
			_lose()
var round = 1:
	set(value):
		round = value
		rounds_node.text = str(value)

var score = 0:
	set(value):
		score = value
		score_node.text = str(value)

@export var bird_node : PackedScene
var bird 

func _ready() -> void:
	_default_display()
	_spawn()

func _default_display():
	bullets_node.text = str(bullets_count)
	rounds_node.text = str(round)
	score_node.text = str(score)

func _spawn():
	if bird != null:
		await bird.tree_exited
	bird = bird_node.instantiate()
	
	bird.speed = round * 100
	bird.position = Vector2(160,90)
	bird.next_round.connect(_on_next_round)
	bird.call_deferred("set_name", "Bird")
	
	get_tree().current_scene.add_child(bird)

func _on_next_round():
	score += round * 100
	round += 1
	bullets_count = 3

	_spawn()

func _input(event):
	if event.is_action_pressed("shoot"):
		bullets_count -= 1

func _lose():
	if $Timer.is_stopped():
		find_child("Dog").dog_laught()
		find_child("Bird", false, false).input_pickable = false
		$Timer.start()
		

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
