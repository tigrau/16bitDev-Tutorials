extends Placeable

var DAMAGE = 90

func _on_body_entered(body):
	body.damage_tick(1,DAMAGE)
	body.play_VFX("Lightning")
