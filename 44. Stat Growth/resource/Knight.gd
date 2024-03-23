extends Resource
class_name Knight

var HP : int
var Strength : int
var Vitality : int
var Agility : int
var Defense : int

func _init() -> void:
	HP = 100
	Strength = 7
	Vitality = 7
	Agility = 7
	Defense = 7

func set_base_stats(target):
	target.HP = HP
	target.Strength = Strength
	target.Vitality = Vitality
	target.Agility = Agility
	target.Defense = Defense

func stats_growth(target):
	target.HP += 20
	target.Strength += 4
	target.Vitality += 2
	target.Agility += 1
	target.Defense += 5
