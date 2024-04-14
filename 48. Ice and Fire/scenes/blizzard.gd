extends Area2D

var speed_percent = 0.1
var duration = 5
var flag = true

var is_placed: bool = false:
	set(value):
		is_placed = value
		if flag:
			$CollisionShape2D.disabled = false
			$Timer.start()
			$Indicator.hide()
			
			$GPUParticles2D.emitting = true
			$GPUParticles2D2.emitting = true
			$AudioStreamPlayer.play()
			flag = false
func _physics_process(delta: float) -> void:
	if not is_placed:
		position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("place"):
		is_placed = true


func _on_body_entered(body: Node2D) -> void:
	body.slow_down(speed_percent, duration)
	body.damage_tick(5)


func _on_timer_timeout() -> void:
	queue_free()
