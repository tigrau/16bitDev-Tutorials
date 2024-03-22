extends StatusEffect
class_name Haste

func _init(time = 3) -> void:
	super._init(time)
	animation_name = "Haste"

func apply(target):
	super.apply(target)
	target.movement_speed = 300
	#target.attack_speed = 2

func remove(target):
	super.remove(target)
	target.movement_speed = 100
	#target.attack_speed = 1
