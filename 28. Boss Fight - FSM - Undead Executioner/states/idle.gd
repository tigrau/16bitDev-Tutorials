extends StateSkeletonBoss

@onready var collision_shape: CollisionShape2D = $"../../PlayerDetection/CollisionShape2D"
@onready var progress_bar: ProgressBar = $"../../CanvasLayer/ProgressBar"

var player_entered: bool = false:
	set(value):
		player_entered = value
		progress_bar.set_deferred("visible", value)
		collision_shape.set_deferred("disabled", value)


func _on_player_entered(body: Node2D) -> void:
	player_entered = true

func transition():
	if player_entered:
		get_parent().change_state("Follow")
