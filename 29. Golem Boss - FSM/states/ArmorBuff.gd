extends GolemBossState

var can_transition : bool = false

func enter():
	super.enter()
	owner.find_child("Pivot").find_child("Sprite2D").hide()
	animation_player.play("armor_buff")
	await animation_player.animation_finished
	can_transition = true

func transition():
	if can_transition:
		get_parent().change_state("Follow")
