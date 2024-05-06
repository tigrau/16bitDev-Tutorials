extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var progress_bar: ProgressBar = $ProgressBar

@export var floating_text_node : PackedScene

var damage_amount : float = 75

var lifesteal_multiplier: float = 0
var regen_amount: float = 0
var damage_reflect_multiplier: float = 0
var evasion_chance: float = 0

#func _ready():
	#lifesteal_multiplier = 0.5
	#regen_amount = 5
	#damage_reflect_multiplier = 0.5
	#evasion_chance = 0.8
	#
	#set_aura()

func _physics_process(delta: float) -> void:
	regen(delta)
	
	animation()
	set_direction()
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 100
	move_and_slide()

func _input(event):
	if event.is_action_pressed("attack"):
		play_skill("attack")

func animation():
	if velocity.length() == 0:
		animation_player.play("idle")
	else:
		animation_player.play("run")

func set_direction():
	if velocity.x > 0:
		%Hitbox.scale.x = 1
		sprite.flip_h = false
	elif velocity.x < 0:
		%Hitbox.scale.x = -1
		sprite.flip_h = true

func play_skill(animation_name):
	animation_player.play(animation_name)
	set_physics_process(false)
	
	await animation_player.animation_finished
	
	animation_player.play("idle")
	set_physics_process(true)

func regen(delta):
	progress_bar.value += delta * regen_amount

func take_damage(amount, source):
	
	var chance = randf()
	if chance < evasion_chance:
		print("miss")
		set_status("Miss")
		return
	
	progress_bar.value -= amount

	if source != null:
		source.take_damage(damage_reflect_multiplier * amount)
		set_status("Reflect")


func _on_hitbox_body_entered(body: Node2D) -> void:
	body.take_damage(damage_amount)
	progress_bar.value += damage_amount * lifesteal_multiplier
	
	if lifesteal_multiplier > 0:
		set_status("Life Streal")

func set_aura(amount = 10.0):
	$Aura.set_aura(amount)

func set_status(status_text):
	var status = floating_text_node.instantiate()
	
	status.position = global_position
	status.find_child("Label").text = status_text
	
	get_tree().current_scene.add_child(status)
