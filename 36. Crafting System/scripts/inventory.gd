extends GridContainer

@onready var slots = get_children()
signal item_changed

#region Testing
#@export var ITEM : Item36
#@export var ITEM2 : Item36
#
#func _ready() -> void:
	#await get_tree().create_timer(2).timeout
	#add_item(ITEM)
	#await get_tree().create_timer(2).timeout
	#add_item(ITEM2)
#endregion
	
func add_item(item):
	for slot in slots:
		if slot.item == null:
			slot.item = item
			item_changed.emit()
			return

func remove_item(item):
	for i in get_children():
		if i.item == item:
			i.item = null
			item_changed.emit()
			return

func is_available(item):
	for i in get_children():
		if i.item == item:
			return true
	return false

func print_plz():
	print("nashel")
