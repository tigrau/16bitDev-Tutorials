extends GolemBossState

@export var arm_node : PackedScene
var can_transit : bool = false
func enter():
	super.enter()
	animation_player.play("homing_missle")
	await animation_player.animation_finished
	can_transit = true
	
func shoot():
	var hand_pos = Vector2(20,-20)
	if owner.sprite.flip_h: hand_pos = Vector2(-20,-20)
	var arm = arm_node.instantiate()
	arm.position = global_position + hand_pos
	owner.get_parent().call_deferred("add_child", arm)
	arm.velocity = (player.position - arm.position).normalized() * 50


func transition():
	if can_transit:
		get_parent().change_state("Dash")
		can_transit = false
