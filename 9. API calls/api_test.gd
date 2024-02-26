extends Node2D

@onready var http_request: HTTPRequest = $HTTPRequest
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var rich_text_label: RichTextLabel = $RichTextLabel

const URL = "http://www.dnd5eapi.co"

@export var button : PackedScene

func _ready() -> void:
	http_request.request(URL + "/api/")

func _on__request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	if result == 0 and response_code == 200:
		for key in json:
			var new_button = button.instantiate()
			
			new_button.info.connect(display_data)
			new_button.text = key
			new_button.page = json[key]
			
			v_box_container.add_child(new_button)
			
func display_data(data):
	rich_text_label.clear()
	
	for outer_key in data["results"]:
		for key in outer_key:
			var data_text = key + " : " + outer_key[key]
			rich_text_label.add_text(data_text)
			rich_text_label.newline()
		rich_text_label.newline()
		
