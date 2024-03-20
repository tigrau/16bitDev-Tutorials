extends Resource
class_name Item40

@export var icon: Texture2D
@export var name: String
@export var path: String

@export_enum("Weapon", "Armor", "Potion")
var type : String = "Weapon"

@export_enum("Common", "Rare", "Epic", "Legendary")
var rarity: String = "Common"

@export_multiline var description: String
