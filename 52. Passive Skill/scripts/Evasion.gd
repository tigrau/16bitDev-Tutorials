extends Skill52
class_name Evasion52

func _init(target,slot) -> void:
	icon = preload("res://22. Skill Treee/assets/Barbarian_2.png")
	skill_function(target,slot)

func skill_function(target,slot):
	super.skill_function(target,slot)
	target.evasion_chance = 0.8
	
