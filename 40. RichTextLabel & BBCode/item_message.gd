extends CanvasLayer

@onready var message: RichTextLabel = $Message

#region Testing
#@export var ITEM : Item40
#
#func _ready() -> void:
	#send_message(ITEM)
#endregion

func send_message(item):
	message.append_text(set_hint(item))
	message.append_text(set_image(item) + '\n')

func set_image(item):
	return "[img=16x16]" + item.path + "[/img]"

func set_hint(item):
	var text = "[hint=%s]%s[/hint]" % [item.description, item.name]

	match item.rarity:
		"Rare":
			text = "[color=blue]" + text + "[/color]"
		"Epic":
			text = "[wave amp=15 freq=5][color=purple]" + text + "[/color][/wave]"
		"Legendary":
			text = "[tornado radius=1 freq=4][color=yellow]" + text + "[/color][/tornado]"
	return text
