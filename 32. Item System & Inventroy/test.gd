extends Node2D

var dick1 = {
	"1" : 1,
	"2" : 2,
	"3" : 3
}
var dick2 = {
	"7" : 7
}
func _ready() -> void:
	dick1 = dick2
	print(dick1)
