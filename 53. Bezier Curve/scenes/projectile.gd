extends Area2D

@export var speed: float = 1.0
@export var deviation_distance : float = 120
@export var deviation_angle : float = 60

var p0 : Vector2
var p1 : Vector2
var p2 : Vector2

var t : float = 0.0

var can_return : bool = true
var returning : bool = false

var type : String = "Projectile"

var enemy = null

func _ready():
	set_physics_process(false)
	#set_destination(Vector2(192,128))

func set_destination(destination):
	p0 = global_position
	p2 = destination
	
	var tilted_unit_vector = (p2-p0).normalized().rotated(deg_to_rad(-deviation_angle))
	p1 = p0 + deviation_distance * tilted_unit_vector
	
	call_deferred("set_physics_process", true)

func set_deviation(distance, angle):
	deviation_distance = distance
	deviation_angle = angle

func set_can_return(value):
	can_return = value

func set_type(value):
	type = value

func set_texture(texture):
	$Sprite2D.texture = texture


#func _quadratic_bezier() -> Vector2:
	#var q0: Vector2 = p0.lerp(p1,t)
	#var q1: Vector2 = p1.lerp(p2,t)
	#return q0.lerp(q1,t)

func _physics_process(delta: float) -> void:
	
	p0 = get_tree().current_scene.find_child("Player").global_position
	
	if not returning:
		if t < 1.0:
			t += speed * delta
			
			if can_return and t >= 1.0:
				returning = true
			elif t>= 1.0:
				queue_free()
	else:
		if t >= 0:
			t -= speed * delta
			
			if t <= 0.0:
				queue_free()
	
	#position = _quadratic_bezier()
	position = position.bezier_interpolate(p0,p1,p2,t)
	
	if enemy != null:
		enemy.position = position

#func _input(event: InputEvent) -> void:
	#if event is InputEvent:
		#get_tree().change_scene_to_packed(load("res://53. Bezier Curve/scenes/test_scene.tscn"))


func _on_body_entered(body: Node2D) -> void:
	if type == "Hook":
		enemy = body
		returning = true
		return
	body.take_damage()
