extends Skill53
class_name Hook

var distance : Array[float]
var angle : Array[float]
var can_return : Array[bool]

var count : int
var texture : Texture2D

func _init(target, slot):
	icon = preload("res://53. Bezier Curve/assets/meat_hook.png")
	type = "Hook"
	texture = load("res://53. Bezier Curve/assets/Staff.png")

	super._init(target,slot)
	
	count = 1
	
	distance = [120]
	angle = [0]
	can_return = [true]
