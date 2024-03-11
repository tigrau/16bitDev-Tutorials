extends NecromancerState


func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("follow")

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	if owner.direction.length() < 40:
		get_parent().change_state("AttackSkeleton")
