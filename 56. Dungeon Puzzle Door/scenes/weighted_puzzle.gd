extends Area2D

@export var door : Sprite2D

var object = false

var press : bool = false:
	set(value):
		press = value
		%Up.set_deferred("visible", not value)
		%Down.set_deferred("visible", value)

func pressed():
	press = true
	door.open_door()

func unpressed():
	press = false
	door.close_door()


func _on_body_entered(body: Node2D) -> void:
	
	if body is CharacterBody2D and object:
		return
	
	if body is RigidBody2D:
		object = true
	pressed()


func _on_body_exited(body: Node2D) -> void:
	
	if body is CharacterBody2D and object:
		return
	
	if body is RigidBody2D:
		object = false
	unpressed()
