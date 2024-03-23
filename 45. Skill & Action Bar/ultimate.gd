extends Skill45
class_name Ultimate

func _init(target):
	cooldown = 10
	animation_name = "ultimate"
	texture = preload("res://45. Skill & Action Bar/assets/skill_icons13.png")

	super._init(target)

func cast_spell(target):
	super.cast_spell(target)
	target.radial(18)
