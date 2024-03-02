extends Sprite2D
@onready var ray_cast: RayCast2D = $RayCast2D
var distance: float = 5000.0

signal hooked(hooked_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		interpolate(await check_collision())
		await get_tree().create_timer(0.2).timeout
		reverse_interpolate()
		

func interpolate(lenght, duration = 0.2 ):
	var tween_offset = get_tree().create_tween()
	var tween_rech_h = get_tree().create_tween()
	
	tween_offset.tween_property(self, "offset", Vector2(0, lenght/2.0), duration)
	tween_rech_h.tween_property(self, "region_rect", Rect2(0,0,356,lenght), duration)

func reverse_interpolate():
	interpolate(0,0.75)

func check_collision():
	await  get_tree().create_timer(0.1).timeout
	var collision_point
	if ray_cast.is_colliding():
		collision_point = ray_cast.get_collision_point()
		distance = (global_position - collision_point).length()
		hooked.emit(collision_point)
	else:
		distance = 5000.0
	return distance
		
