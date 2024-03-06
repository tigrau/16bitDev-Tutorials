extends State

@export var bullet_node : PackedScene
@onready var timer: Timer = $Timer
var phase_2 : bool = false

func enter():
	super.enter()
	timer.start()

func exite():
	super.exite()
	timer.stop()

func shoot():
	var bullet = bullet_node.instantiate()
	
	bullet.position = global_position
	bullet.direction = (owner.get_parent().find_child("Player").global_position - global_position).normalized()
	
	bullet.set_collision_mask_value(1, true)
	bullet.set_collision_mask_value(2, false)
	
	get_tree().current_scene.add_child(bullet)


func _on_timer_timeout() -> void:
	shoot()

func transition() -> void:
	if progress_bar.value <= 5 and not phase_2:
		phase_2 = true
		get_parent().change_state("Illusion")

func _process(_delta: float) -> void:
	if progress_bar.value <= 0:
		timer.stop()
