extends Node2D

func reset():
	var children = get_children()
	
	for child in children:
		child.turn_off_detection()
		
	for child in children:
		child.turn_on_collision()
