extends CharacterBody2D

func wake_up():
	$AnimatedSprite2D.play("wake_up")
	$AnimatedSprite2D.scale = Vector2(2.0,2.0)

func sleep():
	$AnimatedSprite2D.play("sleep")
	$AnimatedSprite2D.scale = Vector2(0.1,0.1)
