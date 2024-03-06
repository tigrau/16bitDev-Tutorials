extends State

@onready var spawn_ponts = owner.get_parent().find_child("SpawnPoints").get_children()
@export var minion_scene : PackedScene

func enter():
	super.enter()
	secon_phase()

func spawn_minions(index) -> void:
	var minion_instance = minion_scene.instantiate()
	minion_instance.position = global_position
	
	get_tree().current_scene.add_child(minion_instance)

	minion_instance.scatter(spawn_ponts[index].position)

func secon_phase():
	animated_player.play("phase_2")
	spawn_ponts.shuffle()
	
	for i in range(3):
		spawn_minions(i+1)
		
	await owner.scatter(spawn_ponts[0].position)
	get_parent().change_state("Shoot")
