extends NecromancerState

func enter():
	super.enter()
	animation_player.play("death")
