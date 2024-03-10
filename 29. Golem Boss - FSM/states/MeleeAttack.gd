extends GolemBossState

var flag : bool = false

func enter():
	super.enter()
	animation_player.play("melee_attack")
	await animation_player.animation_finished
	flag = true
	
func transition():
	if flag:
		get_parent().change_state("Follow")
		flag = false
