extends Sprite2D

@onready var detection: CollisionShape2D = $Detection/CollisionShape2D
@onready var collision: CollisionShape2D = $Collision/CollisionShape2D
@export var can_control: bool = false

func interpolate(lenght, duration = 0.1):
	var tween_offset = get_tree().create_tween()
	var tween_rect_h = get_tree().create_tween()
	
	tween_offset.tween_property(self, "offset", Vector2(0, lenght/2.0), duration)
	tween_rect_h.tween_property(self, "region_rect", Rect2(16,0,95,lenght),duration)

func spark(distance = 900):
	
	if not can_control:
		await get_tree().create_timer(0.3).timeout
	
	detection.set_deferred("disabled", false)
	collision.set_deferred("disabled", true)
	
	
	interpolate(distance, 0.2)
	await get_tree().create_timer(0.2).timeout
	interpolate(0,0.1)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and can_control:
		if $Timer.is_stopped():
			spark()
			$Timer.start()


func _on_detection_area_entered(area: Area2D) -> void:
	var vector = area.get_parent().position - position
	set_deferred("rotation",vector.angle() - PI/2)
	area.get_parent().spark(vector.length()*10)


func _on_timer_timeout() -> void:
	get_parent().reset()
	
func turn_off_detection():
	detection.set_deferred("disabled",true)

func turn_on_collision():
	collision.set_deferred("disabled",false)
