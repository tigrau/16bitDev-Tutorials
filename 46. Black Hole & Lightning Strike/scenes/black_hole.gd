extends Placeable

var DAMAGE = 20

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if is_placed:
		rotation_degrees += 12 * delta

func _on_body_entered(body):
	body.pull_blackhole(global_position, 3)
	body.damage_tick(3,DAMAGE)
