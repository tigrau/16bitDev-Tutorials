extends Skill52
class_name LifeSteal52

func _init(target,slot) -> void:
	icon = preload("res://22. Skill Treee/assets/Barbarian_5.png")
	skill_function(target,slot)

func skill_function(target,slot):
	super.skill_function(target,slot)
	target.lifesteal_multiplier = 1
