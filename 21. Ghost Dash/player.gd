extends CharacterBody2D

@export var ghost_node : PackedScene
@onready var ghost_timer: Timer = $GhostTimer
@onready var particles: GPUParticles2D = $GPUParticles2D

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 300
	move_and_slide()

func add_ghost():
	var ghost = ghost_node.instantiate()
	ghost.set_property(position, $Sprite2D.scale)
	get_tree().current_scene.add_child(ghost)


func _on_ghost_timer_timeout() -> void:
	add_ghost()

func dash():
	ghost_timer.start()
	particles.emitting = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + velocity * 1.5, 0.45)
	
	await tween.finished
	ghost_timer.stop()
	particles.emitting = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		dash()
