extends CharacterBody2D
class_name AbstractEnemy

@export var item_node: PackedScene

var content
var table_name = ""

func _ready() -> void:
	randomize()
	var file = FileAccess.open("res://24. Inventory System/"+ table_name + ".json", FileAccess.READ)
	
	content = JSON.parse_string(file.get_as_text())

	file.close()

func item_drop(id):
	var item = item_node.instantiate()
	item.set_property(id)
	item.position = global_position
	get_tree().current_scene.add_child(item)

func drop_loot():
	var total_weight = 0
	var cumulative_weight = []
	
	for i in content:
		total_weight += int(content[i]["weight"])
		cumulative_weight.append([content[i]["ItemId"],total_weight])
		
	var chance = randf_range(0,total_weight)
	
	for i in cumulative_weight:
		if chance < i[1]:
			item_drop(str(i[0]))
			print(chance, "\n", i[0])
			return
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		drop_loot()
		queue_free()
