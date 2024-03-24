extends Resource
class_name BlackHole

var angle : float
var distance : float
var blackhole_pos : Vector2

func _init(target,center):
	angle = (target.global_position - center).angle()
	distance = (target.global_position - center).length()
	blackhole_pos = center

func revolution(target, delta):
	angle += 0.5 * delta
	target.global_position = blackhole_pos + distance * Vector2(cos(angle),sin(angle))

func degrade(delta):
	distance -= 7 * delta

func skill_process(target,delta):
	revolution(target,delta)
	degrade(delta)
