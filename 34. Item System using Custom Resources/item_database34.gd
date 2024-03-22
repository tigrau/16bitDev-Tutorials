extends Node2D

var cache : Dictionary = {}

@export_dir var item_folder

func _ready() -> void:
	var folder = DirAccess.open(item_folder)
	folder.list_dir_begin()
	
	var file_name = folder.get_next()

	while file_name != "":
		cache[file_name] = load(item_folder + "/" + file_name)
		
		file_name = folder.get_next()
	#print(cache)
func get_item(ID):
	return cache[ID + ".tres"]
