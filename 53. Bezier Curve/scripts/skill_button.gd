extends TextureButton

@export var skill : Resource
var skill_instance

func _ready() -> void:
	skill_instance = skill.new(owner, self)


func _on_pressed() -> void:
	owner.current_skill = skill_instance
