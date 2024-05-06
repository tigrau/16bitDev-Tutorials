extends Area2D

var damage : float = 10.0

func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage)

func set_aura(amount = 10.0):
	damage = amount
	$AnimationPlayer.play("DamageOverTime")
