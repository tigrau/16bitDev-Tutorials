extends StateSkeletonBoss

func _enter_tree() -> void:
	randomize()

func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("idle")

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():
	if owner.direction.length() < 40:
		get_parent().change_state("Attack")
	if owner.direction.length() > 150:
		var chance = randi()%2
		match chance:
			0:
				get_parent().change_state("SpawnMinion")
			1:
				get_parent().change_state("Teleport")
