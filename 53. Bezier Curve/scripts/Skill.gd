extends Resource
class_name Skill53

var icon : Texture2D = preload("res://icon.svg")
var type : String = ""

func _init(_target, slot):
	if slot != null:
		slot.texture_normal = icon
