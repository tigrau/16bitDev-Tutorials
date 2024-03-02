extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	animation_player.play("idle")


func _on_player_entered(body: Node2D) -> void:
	animation_player.play("attack")


func _on_hit_box_entered(body: Node2D) -> void:
	body.take_damage()
