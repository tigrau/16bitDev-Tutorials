extends Resource
class_name Item36

@export var icon: Texture2D
@export var name : String

@export var recipe: Array[Item36]

@export_enum("Weapon", "Material") 
var type = "Material"

@export_multiline var description: String
