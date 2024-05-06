extends Skill52
class_name Obratka52

func _init(target, slot) -> void:
	icon = preload("res://22. Skill Treee/assets/Barbarian_3.png")
	skill_function(target,slot)

func skill_function(target, slot):
	super.skill_function(target, slot)
	target.damage_reflect_multiplier = 0.5
