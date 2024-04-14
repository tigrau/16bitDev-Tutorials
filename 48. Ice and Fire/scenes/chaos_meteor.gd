extends Node2D

var flag = true

var is_placed: bool = false:
	set(value):
		is_placed = value
		
		if flag:
			$AnimationPlayer.play("roll")
			$AudioStreamPlayer.play()
			flag = false



func _on_body_entered(body: Node2D) -> void:
	body.damage()

func _physics_process(delta: float) -> void:
	if not is_placed:
		rotation = position.direction_to(get_global_mouse_position()).angle()
		
	$Rock.rotation += delta

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("place"):
		is_placed = true
