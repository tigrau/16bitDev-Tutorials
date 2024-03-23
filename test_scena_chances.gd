extends Node2D

var M = [["a",35],["b",55],["c",10]]
var weigth := 0
func _ready() -> void:
	for i in M.size():
		M[i][1] = M[i][1] + weigth
		weigth = 0 
		weigth += M[i][1]
	print(M)
	var random = randi_range(0,100)
	print(random)
	for i in M.size():
		if random < M[i][1]:
			print("vipalo: " + M[i][0])
			break
