extends Skill52
class_name Regen52

func _init(target, slot) -> void:
	icon = preload("res://22. Skill Treee/assets/Barbarian_1.png")
	skill_function(target,slot)

func skill_function(target, slot):
	super.skill_function(target, slot)
	target.regen_amount = 5
