extends CharacterBody2D

@export var projectile_node: PackedScene

#Testing
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		match event.keycode:
			KEY_1:
				pass
				#radial(18)
			KEY_2:
				pass
				#radial(32)
			KEY_3:
				pass
				#radial(64)
			KEY_4:
				pass
				#radial(128)
			KEY_5:
				pass
				#radial(360)
			KEY_6:
				radial_2(360)
			KEY_7:
				radial_2(180)
func single_shot(animation_name = "fire"):
	var projectile = projectile_node.instantiate()
	
	projectile.play(animation_name)
	
	projectile.position = global_position
	projectile.direction = (get_global_mouse_position() - global_position).normalized()
	
	get_tree().current_scene.call_deferred("add_child", projectile)
	
func multi_shot(count: int = 3, delay: float = 0.3, animation_name = "fire"):
		for i in range(count):
			single_shot(animation_name)
			await get_tree().create_timer(delay).timeout

func angled_shot(angle, i):
	var projectile = projectile_node.instantiate()
	
	if i % 2 == 0:
		projectile.play("dark")
	else:
		projectile.play("fire")
	
	projectile.position = global_position
	projectile.direction = Vector2(cos(angle),sin(angle))
	
	get_tree().current_scene.call_deferred("add_child", projectile)

func radial(count):
	for i in range(count):
		angled_shot( (float(i) / count) * 2.0 * PI, i) 

func radial_2(count):
	for i in range(count):
		angled_shot_2( (float(i) / count) * 2.0 * PI, i) 

func angled_shot_2(angle, i):
	var projectile = projectile_node.instantiate()
	
	if i % 2 == 0:
		projectile.play("water")
	else:
		projectile.play("tornado")
	
	projectile.position = global_position
	projectile.direction = Vector2(cos(angle),sin(angle))
	
	get_tree().current_scene.call_deferred("add_child", projectile)
