extends NecromancerState

@export var bullet_node : PackedScene
var can_transition
var direction
func enter():
	super.enter()
	can_transition = false
	
	animation_player.play("range_attack")
	await animation_player.animation_finished
	
	can_transition = true

func shoot():
	var bullet = bullet_node.instantiate()
	if owner.direction.x < 0:
		direction = Vector2(23, -28)
	else:
		direction = Vector2(-23, -28)
	bullet.position = owner.position + direction
	get_tree().current_scene.add_child(bullet)

func transition():
	if can_transition:
		get_parent().change_state("Summon")
