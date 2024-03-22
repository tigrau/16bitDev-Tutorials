extends CharacterBody2D

var movement_speed : float = 100
var attack_speed : float = 1.0:
	set(value):
		attack_speed = value
		$WeaponAnimation.speed_scale = value

var status_effects : Array = []

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_1:
			apply_status_effect(Stun.new(1))
		if event.keycode == KEY_2:
			apply_status_effect(Slow.new(7))
		if event.keycode == KEY_3:
			apply_status_effect(Haste.new(1))
		if event.keycode == KEY_4:
			apply_status_effect(Fatigue.new(1))
		if event.keycode == KEY_5:
			apply_status_effect(Berserk.new(1))

func _physics_process(delta: float) -> void:
	
	if position.y > 350:
		movement_speed = -abs(movement_speed)
	elif position.y < 50:
		movement_speed = abs(movement_speed)
	
	velocity.y = movement_speed
	move_and_slide()
	
	for i in range(status_effects.size()):
		var effect  = status_effects[i]
		effect.duration -= delta
		
		if effect.duration < 0:
			effect.remove(self)
			status_effects.remove_at(i)
			print(status_effects)
			reset_effect()
			break

func play(animation_name):
	$AnimationPlayer.play(animation_name)

func apply_status_effect(effect):
	
	for i in range(status_effects.size()):
		if status_effects[i].get_class_name() == effect.get_class_name():
			status_effects[i].duration = effect.duration
			return
	
	status_effects.append(effect)
	effect.apply(self)
	print(status_effects)

func reset_effect():
	for i in status_effects:
		i.apply(self)
