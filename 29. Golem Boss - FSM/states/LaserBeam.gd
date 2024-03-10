extends GolemBossState

@onready var pivot = owner.find_child("Pivot")
@onready var sprite_2d: Sprite2D = $"../../Pivot/Sprite2D"
var can_transit : bool = false

func enter():
	super.enter()
	set_process(true)
	animation_player.play("laser_beam")
	await animation_player.animation_finished
	can_transit = true
func stop():
	set_process(false)

func _process(_delta: float) -> void:
	pivot.rotation = (player.position - pivot.global_position).angle()

func transition():
	if can_transit:
		get_parent().change_state("Dash")
		can_transit = false
