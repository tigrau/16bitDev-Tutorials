extends Button

@onready var http_request: HTTPRequest = $HTTPRequest
const URL = "https://www.dnd5eapi.co"
var page := "/api"

signal info(data)

func _on_pressed() -> void:
	http_request.request(URL + page)


func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var data = JSON.parse_string(body.get_string_from_utf8())
	info.emit(data)
