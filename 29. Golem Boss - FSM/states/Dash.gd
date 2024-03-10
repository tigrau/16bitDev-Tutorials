extends GolemBossState

var can_transit : bool = false

func enter():
	super.enter()
	move()
	animation_player.play("dash")

func move():
	var tween = get_tree().create_tween()
	tween.tween_property(owner, "position", player.position, 0.6)
	await tween.finished
	can_transit = true
	
func transition():
	if can_transit:
		get_parent().change_state("Follow")
		can_transit = false
		
