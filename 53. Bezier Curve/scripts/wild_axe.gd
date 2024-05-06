extends Skill53
class_name WildAxe

var distance : Array[float]
var angle : Array[float]
var can_return : Array[bool]

var count : int
var texture : Texture2D

func _init(target, slot) -> void:
	icon = preload("res://53. Bezier Curve/assets/wild_axe.png")
	type = "Projectile"
	texture = load("res://53. Bezier Curve/assets/Battle Axe.png")
	super._init(target,slot)
	
	count = 2
	
	distance = [125,125]
	angle = [60,-60]
	can_return = [true,true]
