extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass







func _on_button_pressed():#Pressed uplaod button
	var children = $DrawScreen.get_children()
	var childPoints = []
	for child in children:
		#print(child.points)
		#print(Array(child.points))
		if Array(child.points) != []:
			childPoints.append(Array(child.points))
	print(childPoints)
	
