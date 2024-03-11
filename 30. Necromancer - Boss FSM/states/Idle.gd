extends NecromancerState

@onready var progress_bar: ProgressBar = %ProgressBar2
@onready var collision_shape: CollisionShape2D = %CollisionShape2D2

var player_entered : bool = false:
	set(value):
		print("enter")
		player_entered = value
		progress_bar.visible = value
		collision_shape.set_deferred("disabled", value)

func _on_player_entered(_body: Node2D) -> void:
	player_entered = true

func transition():
	if player_entered:
		get_parent().change_state("Summon")
