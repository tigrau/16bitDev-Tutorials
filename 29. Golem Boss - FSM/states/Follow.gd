extends GolemBossState

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("follow")

func exit():
	super.exit()
	owner.set_physics_process(false)


func transition():
	var distance = owner.direction.length()
	
	if distance <= 55:
		get_parent().change_state("MeleeAttack")
	elif distance >= 200:
		var random = randi() % 2
		match random:
			0:
				get_parent().change_state("HomingMissle")
			1:
				get_parent().change_state("LaserBeam")
