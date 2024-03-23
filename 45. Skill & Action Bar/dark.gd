extends Skill45
class_name DarkBall

func _init(target) -> void:
	cooldown = 2.0
	animation_name = "dark"
	texture = preload("res://45. Skill & Action Bar/assets/skill_icons29.png")
	
	super._init(target)

func cast_spell(target):
	super.cast_spell(target)
	target.multi_shot(15, 0.1, animation_name)
