extends GolemBossState

func enter():
	super.enter()
	animation_player.play("death")
	owner.find_child("Pivot").find_child("Sprite2D").hide()
	await animation_player.animation_finished
	animation_player.play("boss_slained")

