extends Resource
class_name Skill52

var icon : Texture2D = preload("res://icon.svg")

func skill_function(target, slot):
	if slot != null:
		slot.texture = icon
