extends CharacterBody2D

func take_damage():
	$AnimationPlayer.play("hit")
