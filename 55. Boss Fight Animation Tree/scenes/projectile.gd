extends Area2D

var p0: Vector2
var p1: Vector2
var p2: Vector2

var t: float = 0.0
var speed: float = 2.0

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	if t < 1.0:
		t += speed * delta
		position = position.bezier_interpolate(p0,p1,p2,t)
		if t >= 1.0:
			$AnimationPlayer.play("land_1")

func _on_body_entered(body: Node2D) -> void:
	body.take_damage()

func set_destination(destination):
	p0 = global_position
	p2 = destination
	
	var angle
	if (p2-p0).x < 0:
		angle = 60
	else:
		angle = -60
	
	var tilted_unit_vector = (p2-p0).normalized().rotated(deg_to_rad(angle))
	p1 = p0 + 120 * tilted_unit_vector

	call_deferred("set_physics_process", true)
