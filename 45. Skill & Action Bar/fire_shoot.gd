extends Skill45
class_name FireShot

func _init(target):
	cooldown = 2.0
	animation_name = "fire"
	texture = preload("res://45. Skill & Action Bar/assets/skill_icons4.png")

	super._init(target)

func cast_spell(target):
	super.cast_spell(target)
	target.multi_shot()
