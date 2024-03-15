extends Node2D

var current_index : int = 0
var inventory ={}

func _ready() -> void:
	for i in range(4):
		inventory[i] = null

func reset():
	var weapons = get_children()
	for weapon in weapons:
		weapon.hide()

func show_weapon(index):
	#if index < get_child_count():
		#get_child(index).show()
	if inventory[index] == null:
		reset()
		return
	inventory[index].show()


func _on_hot_bar_index(i = current_index) -> void:
	reset()
	show_weapon(i)
	current_index = i


func _on_child_entered_tree(node: Node) -> void:
	var index = owner.find_child("HotBar").new_index
	inventory[index] = node
	_on_hot_bar_index()

func swap(i,j):
	var temp = inventory[i]
	inventory[i] = inventory[j]
	inventory[j] = temp
	_on_hot_bar_index

func is_available():
	for i in inventory:
		if inventory[i] == null:
			return true
	return false
