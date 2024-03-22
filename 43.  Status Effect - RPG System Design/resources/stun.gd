extends StatusEffect
class_name Stun

func _init(time = 3) -> void:
	super._init(time)
	animation_name = "Stun"

func apply(target):
	super.apply(target)
	target.movement_speed = 0
	target.attack_speed = 0

func remove(target):
	super.remove(target)
	target.movement_speed = 100
	target.attack_speed = 1
