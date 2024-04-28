extends CharacterBody2D

@export var physical_resistance : float = 0.2
@export var elemental_resistance : float = 0.25

@export var floating_text_node : PackedScene

func take_damage(damage: Damage51):
	var effective_damage : float = 0
	
	if damage.type == "Physical":
		effective_damage = damage.amount * (1-physical_resistance)
	else:
		effective_damage = damage.amount * (1-elemental_resistance)

	print(effective_damage)
	spawn_floating_text(damage, effective_damage)

func spawn_floating_text(damage: Damage51, effective_damage):
	var number = floating_text_node.instantiate()
	
	number.global_position = global_position
	number.find_child("Label").text = "%.2f" % effective_damage
	#number.find_child("Label").text = "Hi"
	number.find_child("AnimationPlayer").play(damage.type)
	
	get_tree().current_scene.add_child(number)

func elemental_weakness(value = 0.75):
	elemental_resistance -= value
	print(elemental_resistance)

func set_status(status_text):
	var status = floating_text_node.instantiate()
	
	status.position = global_position
	status.find_child("AnimationPlayer").play(status_text)
	
	get_tree().current_scene.add_child(status)
