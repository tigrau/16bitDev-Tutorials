extends Skill53
class_name CrescentStrike

var distance : Array[float]
var angle : Array[float]
var can_return : Array[bool]

var count : int
var texture : Texture2D

func _init(target, slot) -> void:
	icon = preload("res://53. Bezier Curve/assets/diana_crescent_strike.png")
	type = "Projectile"
	texture = load("res://53. Bezier Curve/assets/Bomb.png")
	super._init(target,slot)
	
	count = 1
	
	distance = [120]
	angle = [120]
	can_return = [false]
