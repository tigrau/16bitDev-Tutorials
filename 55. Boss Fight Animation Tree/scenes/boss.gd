extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]

const melee_attacks = ["attack_1", "attack_2", "attack_3"]
const range_attacks = ["jump_up","throw"]

@export var player : CharacterBody2D
@export var projectile_node: PackedScene

var p0: Vector2
var p1: Vector2
var p2: Vector2

var t: float = 1
var speed: float = 2.0

var facing_right : bool

var health: float = 100:
	set(value):
		health = value
		%HealthBar.value = health
		
		if value <= 0:
			state_machine.travel("death")
			set_physics_process(false)

func _physics_process(delta: float) -> void:
	facing_right = (player.position - global_position).x <= 0
	
	if facing_right:
		$Sprite2D.flip_h = true
		%HitBox.scale.x = -1
	else:
		$Sprite2D.flip_h = false
		%HitBox.scale.x = 1
	if t < 1.0:
		t += speed * delta
		position = position.bezier_interpolate(p0,p1,p2,t)

func jump():
	t = 0 
	speed = 2.0
	
	var correction : Vector2
	if facing_right:
		correction = Vector2(25,25)
	else:
		correction = Vector2(-25,25)
	
	set_destination(player.position + correction)

func dodge():
	var direction
	t = 0
	speed = 1.5
	
	if facing_right:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT
	
	set_destination(position + direction * 100)

func melee_attack():
	state_machine.travel(melee_attacks.pick_random())

func range_attack():
	await get_tree().create_timer(0.1).timeout
	state_machine.travel(range_attacks.pick_random())

func can_do_special():
	var chance = randf()
	animation_tree["parameters/conditions/can_dodge"] = chance < 0.5

func set_destination(final_position):
	p0 = global_position
	p2 = final_position
	
	var angle
	if (p2-p0).x < 0:
		angle = 60
	else:
		angle = -60
	
	var tilted_unit_vector = (p2-p0).normalized().rotated(deg_to_rad(angle))
	p1 = p0 + 90 * tilted_unit_vector

func shoot():
	var projectile = projectile_node.instantiate()
	projectile.position = position
	
	projectile.set_destination(player.position)
	
	get_tree().current_scene.add_child(projectile)

func _on_player_entered(_body: Node2D) -> void:
	%PlayerCollision.set_deferred("disabled", true)
	range_attack()
	%HealthBar.show()

func take_damage(amount = 1):
	health -= amount
	%VFX.play("hit")
