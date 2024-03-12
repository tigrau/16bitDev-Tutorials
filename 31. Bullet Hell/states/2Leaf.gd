extends BulletHellState

func enter():
	super.enter()
	owner.alpha = 3
	owner.bullet_type = 3

func transition():
	if can_transition:
		get_parent().change_state("5Leaf")
