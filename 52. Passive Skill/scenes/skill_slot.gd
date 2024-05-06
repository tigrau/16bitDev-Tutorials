extends TextureRect

@export var skill_class : Resource

func _ready() -> void:
	if skill_class != null:
		var skill = skill_class.new(owner,self)
