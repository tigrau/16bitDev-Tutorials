extends Skill45
class_name Tornado

func _init(target):
	cooldown = 7.0
	animation_name = "tornado"
	texture = preload("res://45. Skill & Action Bar/assets/skill_icons24.png")

	super._init(target)

func cast_spell(target):
	super.cast_spell(target)
	target.single_shot(animation_name)
