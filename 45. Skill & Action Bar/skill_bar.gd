extends HBoxContainer

var slots : Array
var skills : Array = [FireShot, WaterBall, Tornado, DarkBall, Ultimate]

func _ready() -> void:
	slots = get_children()
	for i in get_child_count():
		slots[i].change_key = str(i+1)
		slots[i].skill = skills[i].new(slots[i])

	#Testing
	#slots[0].skill = FireShot.new(slots[0])
	#slots[1].skill = WaterBall.new(slots[1])
	#slots[2].skill = Tornado.new(slots[2])
	#slots[3].skill = DarkBall.new(slots[3])
	#slots[4].skill = Ultimate.new(slots[4])
