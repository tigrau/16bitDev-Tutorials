extends GolemBossState

@onready var collision_shape_2d: CollisionShape2D = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar = owner.find_child("ProgressBar")

var player_entered : bool = false :
	set(value):
		player_entered = value
		collision_shape_2d.set_deferred("disabled", value)
		progress_bar.set_deferred("visible", value)
		

func _on_player_detection_body_entered(body: Node2D) -> void:
	player_entered = true

func transition():
	if player_entered:
		get_parent().change_state("Follow")
