extends CharacterBody2D

@onready var progress_bar: ProgressBar = $UI/ProgressBar

var health := 10 :
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			progress_bar.visible = false
			$AnimationPlayer.play("boss_slained")
			
func take_damage():
	health -= 1

func scatter(pos):
	var tween_position = get_tree().create_tween()
	tween_position.tween_property(self,"global_position",pos,0.7)
	await tween_position.finished
