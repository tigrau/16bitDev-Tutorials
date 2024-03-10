extends State2
class_name DashState
@onready var timer: Timer = $Timer

func transition():
	if ray_cast.is_colliding():
		get_parent().change_state("Shoot")

func dash():
	var tween = get_tree().create_tween()
	tween.tween_property(owner, "position", player.position, 0.75)


func _on_timer_timeout() -> void:
	dash()

func enter():
	super.enter()
	timer.start()

func exit():
	super.exit()
	timer.stop
