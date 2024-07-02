extends CharacterBody2D

@export var banana_node : PackedScene

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 500
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func take_damage():
	$AnimationPlayer.play("hit")

func shoot():
	var banana = banana_node.instantiate()
	banana.position = position
	get_tree().current_scene.add_child(banana)
