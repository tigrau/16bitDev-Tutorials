extends HBoxContainer

@onready var slots = get_children()

func add_item(ID):
	for slot in slots:
		if slot.stats == null:
			slot.stats = ID
			return

func use_item(current = 0):
	if slots[current].stats != null:
		slots[current].stats.use_item()
