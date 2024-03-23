extends CharacterBody2D

@export_range(0,1000) var DEF: float = 200

@export_range(0,1) var elemental_modifier: float = 0
@export_range(0,1) var crit_chance: float = 0

@export_enum("None","Physical","Fire","Electric") var type_resistance
@export_enum("None","Physical","Fire","Electric") var type_effective

var can_crit: bool = false

@export var floating_number: PackedScene

func _ready() -> void:
	randomize()


func defense(atk) -> float:
	if atk == 0 and DEF == 0:
		return 0.0
		
	return ( atk / (atk+DEF))

func crit(chance) -> float:
	var num = randf_range(0,1)
	
	if num < chance:
		can_crit = true
		return 2.0
	else:
		can_crit = false
		return 1.0

func randomness():
	return randf_range(0.9, 1.0)

func elemental_damage(data) -> float:
	if data == type_resistance:
		elemental_modifier = 0.9
		$AnimationPlayer.play("resistant")
	else:
		elemental_modifier = 0.0
	
	return (1 - elemental_modifier)
	
func effectiveness(data):
	if data == type_effective:
		$AnimationPlayer.play("effective")
		return 1.75
	else:
		return 1.0

func spawn_floating_number(damage):
	var number = floating_number.instantiate()
	number.position = global_position
	number.find_child("Label").text = "%.2f" % damage
	
	if can_crit == false:
		number.find_child("AnimationPlayer").play("normal")
	else:
		number.find_child("AnimationPlayer").play("crit")
		
	get_tree().current_scene.add_child(number)

func effective_damage(data,atk) -> float:
	var damage: float = atk * defense(atk) * crit(crit_chance) * randomness() \
	* elemental_damage(data) * effectiveness(data)
	
	spawn_floating_number(damage)
	
	return damage
