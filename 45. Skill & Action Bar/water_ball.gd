extends Skill45
class_name WaterBall

func _init(target) -> void:
	cooldown = 5.0
	animation_name = "water"
	texture = preload("res://45. Skill & Action Bar/assets/skill_icons48.png")
	
	super._init(target)

func cast_spell(target):
	super.cast_spell(target)
	target.multi_shot(2,0.4,animation_name)
	
