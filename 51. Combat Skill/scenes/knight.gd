extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var damage_types : Array[Damage51]
var current_damage : Damage51

func _physics_process(delta: float) -> void:
	animation()
	set_direction()
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 90
	move_and_slide()

func animation():
	if velocity.length() == 0:
		animation_player.play("idle")
	else:
		animation_player.play("run")

func set_direction():
	if velocity.x > 0:
		$Hitbox.scale.x = 1
		sprite.flip_h = false
	elif velocity.x < 0:
		$Hitbox.scale.x = -1
		sprite.flip_h = true

func play_skill(animation_name):
	animation_player.play(animation_name)
	set_physics_process(false)
	
	await animation_player.animation_finished
	
	animation_player.play("idle")
	set_physics_process(true)

func switch_to_physical():
	current_damage = damage_types[0]

func switch_to_elemental():
	current_damage = damage_types[1]

func _on_hitbox_body_entered(body: Node2D) -> void:
	body.take_damage(current_damage)
