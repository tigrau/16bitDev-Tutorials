extends NecromancerState

func enter():
	super.enter()
	animation_player.play("attack")

func transition():
	if owner.direction.length() > 40:
		get_parent().change_state("Follow")
	
