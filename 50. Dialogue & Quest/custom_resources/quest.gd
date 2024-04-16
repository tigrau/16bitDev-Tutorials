extends Resource
class_name Quest

@export var title : String
@export var description : String

@export_enum("Fetch","Kill") var objective : String
@export var object : String

@export_enum("Active","Complete") var status : String

@export var next_questline : Dialogue
