extends CharacterBody2D

var skill = null

func _physics_process(delta: float) -> void:
	if skill:
		skill.skill_process(self,delta)

func pull_blackhole(center, time = 3):
	skill = BlackHole.new(self,center)
	await get_tree().create_timer(time).timeout
	skill = null

func take_damage(damage = 0):
	$Label.text = str(damage)
	$AnimationPlayer.play("pop")

func damage_tick(count = 0,damage=0):
	for i in range(count):
		take_damage(damage)
		await get_tree().create_timer(1).timeout

func play_VFX(animation_name):
	$VFX.play(animation_name)
