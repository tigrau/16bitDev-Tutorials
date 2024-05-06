extends CharacterBody2D

@export var projectile_node : PackedScene

var current_skill : Skill53 = null
var hook = null

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * 300
	move_and_slide()

	if hook != null:
		%Line2D.set_point_position(0,global_position)
		%Line2D.set_point_position(1,hook.global_position)
	elif hook == null:
		%Line2D.set_point_position(0,Vector2.ZERO)
		%Line2D.set_point_position(1,Vector2.ZERO)

func instance_projectiles(distance, angle, can_return, type, texture):
	var projectile = projectile_node.instantiate()
	projectile.position = position
	
	projectile.set_deviation(distance,angle)
	projectile.set_can_return(can_return)
	projectile.set_destination(get_global_mouse_position())
	projectile.set_type(type)
	projectile.set_texture(texture)
	
	if type == "Hook":
		hook = projectile
		#%Line2D.set_point_position(0,global_position)
		#%Line2D.set_point_position(1,get_global_mouse_position())

	get_tree().current_scene.add_child(projectile)

#testing
#func _ready() -> void:
	#current_skill = Hook.new(self,null)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	if current_skill != null:
		for i in range(current_skill.count):
			var distance = current_skill.distance[i]
			var angle = current_skill.angle[i]
			var can_return = current_skill.can_return[i]
			var type = current_skill.type
			var texture = current_skill.texture
			
			instance_projectiles(distance, angle, can_return, type, texture)
