extends BulletHellState

func enter():
	super.enter()
	owner.alpha = 2
	owner.bullet_type = 2
func transition():
	if can_transition:
		get_parent().change_state("2Leaf")
