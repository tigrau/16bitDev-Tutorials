extends Area2D

@export_enum("None","Physical","Fire","Electric") var damage_type
@export var ATK : int = 200

func _physics_process(delta: float) -> void:
	position.x += 500 * delta

func _on_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.effective_damage(damage_type,ATK)
